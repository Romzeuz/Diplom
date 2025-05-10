import React from 'react';
import { Layout, Menu } from 'antd';
import { Link, useLocation } from 'react-router-dom';

const { Header: AntHeader } = Layout;

const Header: React.FC = () => {
  const location = useLocation();

  const menuItems = [
    { key: '/', label: 'Главная' },
    { key: '/about-raibekas', label: 'О Райбекасе' },
    { key: '/collection', label: 'Коллекция' },
  ];

  return (
    <AntHeader>
      <div className="logo" />
      <Menu
        theme="dark"
        mode="horizontal"
        selectedKeys={[location.pathname]}
        items={menuItems.map(item => ({
          key: item.key,
          label: <Link to={item.key}>{item.label}</Link>,
        }))}
      />
    </AntHeader>
  );
};

export default Header;