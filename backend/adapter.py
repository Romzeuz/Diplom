import os
from typing import Dict, Any

from backend.internal.service.nats_connector import NATSConnector
from internal.service.strapi_connector import StrapiConnector

class Adapter:
    def __init__(self,
                 _strapi_connector: StrapiConnector,
                 _nats_connector: NATSConnector):
        self.strapi_connector = _strapi_connector

        self.nats_connector = _nats_connector
        self.nats_connector.connect()

    def init_routes(self):
        """
        Initialize routes for the adapter.
        """
        # Initialize routes for NATS and Strapi connectors
        self.nats_connector.subscribe("tags_generated", self.handle_tags_generated)

    async def handle_tags_generated(self, _, data: Dict[str, Any] | None):
        """
        Handle the 'tags_generated' event from NATS.
        """
        # Process the data and send it to Strapi
        if data:
            await self.strapi_connector.send_event_to_strapi(data)
        else:
            pass


if __name__ == '__main__':
    import logging

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
    )

    strapi_connector = StrapiConnector()

    nats_url = os.getenv("NATS_URL", None)
    nats_connector = NATSConnector(nats_url)

