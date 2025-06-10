import React, {useState, useEffect} from 'react';
import {Layout as AntLayout} from 'antd';
import Header from './Header';
import Footer from './Footer';

const {Content} = AntLayout;

interface LayoutProps {
    children: React.ReactNode;
}

const Layout: React.FC<LayoutProps> = ({children}) => {
    const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);

    useEffect(() => {
        const handleResize = () => {
            setIsMobile(window.innerWidth <= 768);
        };

        window.addEventListener('resize', handleResize);
        return () => window.removeEventListener('resize', handleResize);
    }, []);

    return (
        <AntLayout className="layout">
            <Header/>
            <Content style={{
                padding: isMobile ? '0 0' : '0 50px',
                minHeight: 'calc(100vh - 134px)',
                maxWidth: '1440px',
                margin: '0 auto',
                width: '100%',
                overflow: 'hidden'
            }}>
                <div className="site-layout-content" style={{width: '100%', overflow: 'hidden'}}>{children}</div>
            </Content>
            <Footer/>
        </AntLayout>
    );
};

export default Layout;