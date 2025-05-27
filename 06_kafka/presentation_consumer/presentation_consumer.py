from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError
import os
from confluent_kafka import Consumer, KafkaError
import json


# Подключение к MongoDB
client = MongoClient(os.getenv("MONGO_URL", "mongodb://mongodb:27017"))
db = client['conference_db']
presentations_col = db['presentations']

# Конфигурация Kafka Consumer
conf = {
    'bootstrap.servers': 'kafka1:9092,kafka2:9092',  # Адрес Kafka брокера
    'group.id': 'my_group',  # ID группы потребителей
    'auto.offset.reset': 'earliest'  # Начинать с самого раннего сообщения
}

# Создание Consumer
consumer = Consumer(conf)

# Подписка на топик
consumer.subscribe(['topic_2'])


def handle_create_command(command_data):
    try:
        print("\n\n\n!!! CREATE !!! \n\n\n")
        presentations_col.insert_one(command_data)
    except Exception as e:
        print(f"Create error: {e}")

def handle_update_command(command_data):
    try:
        print("\n\n\n!!! UPDATE !!! \n\n\n")
        filter_condition = command_data.get('filter', {})
        update_data = command_data.get('update', {})
        result = presentations_col.update_one(filter_condition, update_data)
        print(f"Updated {result.modified_count} document(s)")
    except Exception as e:
        print(f"Update error: {e}")

def handle_delete_command(command_data):
    try:
        print("\n\n\n!!! DELETE !!! \n\n\n")
        # title = command_data['title']
        result = presentations_col.delete_one(command_data)
    except Exception as e:
        print(f"Delete error: {e}")

try:
    while True:
        msg = consumer.poll(1.0)

        if msg is None:
            continue
        if msg.error():
            if msg.error().code() == KafkaError._PARTITION_EOF:
                continue
            print(msg.error())
            continue

        try:
            command = json.loads(msg.value().decode('utf-8'))
            print(f"Received message from partition {msg.partition()}")

            if command['event'] == "create":
                handle_create_command(command['data'])
            elif command['event'] == "update":
                handle_update_command(command['data'])
            elif command['event'] == "delete":
                handle_delete_command(command['data'])
            else:
                print(f"Unknown command type: {command['event']}")

        except json.JSONDecodeError:
            print(f"Invalid JSON: {msg.value()}")
        except Exception as e:
            print(f"Message processing error: {e}")

except KeyboardInterrupt:
    pass
except Exception as e:
        print(f"Fatal error: {e}")
finally:
    consumer.close()
