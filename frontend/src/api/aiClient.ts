import axios from 'axios';
import { API_CONFIG } from './config';
import {AIExplanation, LinkRequest, LinkResponse, Test} from '../types';
import strapiClient from "./strapiClient";

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

  getContextualLinks: async (request: LinkRequest): Promise<LinkResponse> => {
    const response = await aiClient.post('/links', request);
    return response.data;
  },

  getSomething: async (text: string): Promise<Test> => {
    const response = await aiClient.post(`/something`);
    console.log(response.data);
    return response.data;
  }
};

export default aiClient;