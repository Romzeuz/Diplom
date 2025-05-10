import axios from 'axios';
import { API_CONFIG } from './config';
import { AIExplanation } from '../types';

const aiClient = axios.create({
  baseURL: API_CONFIG.AI_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export const aiApi = {
  getExplanation: async (text: string): Promise<AIExplanation> => {
    const response = await aiClient.post('/explain', { text });
    return response.data;
  },

  getContextualLinks: async (text: string): Promise<string[]> => {
    const response = await aiClient.post('/contextual-links', { text });
    return response.data.links;
  },
};

export default aiClient;