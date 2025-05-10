export const API_CONFIG = {
  USE_MOCKS: process.env.REACT_APP_USE_MOCK_API === 'true',
  STRAPI_BASE_URL: process.env.REACT_APP_STRAPI_API_URL || 'http://localhost:1337/api',
  AI_BASE_URL: process.env.REACT_APP_AI_API_URL || 'http://localhost:8000/api'
};