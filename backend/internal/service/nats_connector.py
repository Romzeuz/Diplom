import asyncio
import json
import logging
from nats.aio.client import Client as NATS
from nats.aio.msg import Msg

class NATSConnector:
    def __init__(self, servers=None):
        self.nc = NATS()
        self.servers = servers or ["nats://localhost:4222"]
        self.connected = False
        self.logger = logging.getLogger("NATSConnector")

    async def connect(self):
        if not self.connected:
            await self.nc.connect(servers=self.servers)
            self.connected = True
            self.logger.info(f"Connected to NATS servers: {self.servers}")

    async def publish(self, subject, message: bytes):
        await self.connect()
        await self.nc.publish(subject, message)
        self.logger.info(f"Published message to '{subject}': {message}")

    async def subscribe(self, subject, callback):
        await self.connect()
        async def message_handler(msg: Msg):
            try:
                data = json.loads(msg.data.decode())
                self.logger.info(f"Received message on '{msg.subject}': {data}")
            except Exception as e:
                self.logger.error(f"Failed to decode message on '{msg.subject}': {e}")
                data = None
            await callback(msg.subject, data)
        await self.nc.subscribe(subject, cb=message_handler)
        self.logger.info(f"Subscribed to subject: {subject}")

    async def close(self):
        if self.connected:
            await self.nc.drain()
            self.connected = False
            self.logger.info("Connection to NATS closed.")

# Пример использования:
# async def main():
#     connector = NATSConnector()
#     await connector.publish('test', b'hello')
# asyncio.run(main())

