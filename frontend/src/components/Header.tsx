import React from 'react';
import { Layout, Menu } from 'antd';
import { Link, useLocation } from 'react-router-dom';
import './Header.css';

const { Header: AntHeader } = Layout;

const Header: React.FC = () => {
  const location = useLocation();

  const menuItems = [
    { key: '/', label: 'Главная' },
    { key: '/about-raibekas', label: 'О Райбекасе' },
    { key: '/collection', label: 'Коллекция' },
  ];

  return (
    <AntHeader className="custom-header">
      <div className="header-content">
        <div className="site-logo">
          <Link to="/">Райбекас</Link>
        </div>
        <Menu
          theme="light"
          mode="horizontal"
          selectedKeys={[location.pathname]}
          items={menuItems.map(item => ({
            key: item.key,
            label: <Link to={item.key}>{item.label}</Link>,
          }))}
          className="header-menu"
        />
      </div>
    </AntHeader>
  );
};

export default Header;

