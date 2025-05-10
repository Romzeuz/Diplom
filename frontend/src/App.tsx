import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ConfigProvider } from 'antd';
import ru_RU from 'antd/lib/locale/ru_RU';

import HomePage from './pages/HomePage';
import AboutRaibekasPage from './pages/AboutRaibekasPage';
import CollectionPage from './pages/CollectionPage';
import TextView from './pages/TextView';
import Layout from './components/Layout';

import './App.css';

const App: React.FC = () => {
  return (
    <ConfigProvider locale={ru_RU}>
      <Router>
        <Layout>
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/about-raibekas" element={<AboutRaibekasPage />} />
            <Route path="/collection" element={<CollectionPage />} />
            <Route path="/text/:id" element={<TextView />} />
          </Routes>
        </Layout>
      </Router>
    </ConfigProvider>
  );
};

export default App;