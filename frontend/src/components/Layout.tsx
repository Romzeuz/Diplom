import React from 'react';
import {Layout as AntLayout} from 'antd';
import Header from './Header';
import Footer from './Footer';

const {Content} = AntLayout;

interface LayoutProps {
    children: React.ReactNode;
}

const Layout: React.FC<LayoutProps> = ({children}) => {
    return (
        <AntLayout className="layout">
            <Header/>
            <Content style={{
                padding: '0 50px',
                minHeight: 'calc(100vh - 134px)',
                maxWidth: '1440px',
                margin: '0 auto',
                width: '100%',
            }}>
                <div className="site-layout-content">{children}</div>
            </Content>
            <Footer/>
        </AntLayout>
    );
};

export default Layout;