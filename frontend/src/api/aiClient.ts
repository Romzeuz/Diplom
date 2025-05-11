import axios from 'axios';
import { API_CONFIG } from './config';
import {AIExplanation, Huyna} from '../types';
import strapiClient from "./strapiClient";

const aiClient = axios.create({
  baseURL: API_CONFIG.AI_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export const aiApi = {
  getExplanation: async (text: string): Promise<AIExplanation> => {
    const response = await aiClient.post('/explain', { text: text });
    return response.data;
  },

  getContextualLinks: async (text: string): Promise<string[]> => {
    const response = await aiClient.post('/contextual-links', { text });
    return response.data.links;
  },

  getSomething: async (text: string): Promise<Huyna> => {
    const response = await aiClient.post(`/something`);
    console.log(response.data);
    return response.data;
  }
};

export default aiClient;