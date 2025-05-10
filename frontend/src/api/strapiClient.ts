import axios from 'axios';
import { API_CONFIG } from './config';
import { Text, Author } from '../types';

const strapiClient = axios.create({
  baseURL: API_CONFIG.STRAPI_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export const textApi = {
  getTexts: async (params?: { search?: string; tags?: string[] }): Promise<Text[]> => {
    const response = await strapiClient.get('/texts', { params });
    return response.data.data.map((item: any) => ({
      id: item.id,
      ...item.attributes,
    }));
  },

  getText: async (id: number): Promise<Text> => {
    const response = await strapiClient.get(`/texts/${id}`);
    return {
      id: response.data.data.id,
      ...response.data.data.attributes,
    };
  },
};

export const authorApi = {
  getRaibekasInfo: async (): Promise<Author> => {
    const response = await strapiClient.get('/authors/1'); // Предполагаем, что Райбекас имеет ID 1
    return {
      id: response.data.data.id,
      ...response.data.data.attributes,
    };
  },
};

export default strapiClient;