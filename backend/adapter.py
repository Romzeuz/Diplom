from internal.service.strapi_connector import StrapiConnector

sc = StrapiConnector()
sc.send_event_to_strapi("event")
