import React, { useEffect, useState } from 'react';
import {Row, Col} from 'antd';
import {Link} from "react-router-dom";

export enum AlignEnum {
    LEFT = 'left',
    RIGHT = 'right',
}

interface ImagePaneProps {
    ImageComponent: React.ReactNode;
    HeaderComponent: React.ReactNode;
    TextCardComponent: React.ReactNode;
    Align?: AlignEnum;
    HeaderMargin?: number;
    ParagraphMargin?: number;
    TextAlign?: 'bottom' | 'top' | 'center';
    TextMargin?: number;
    LinkHref?: string;
}

const ImagePane: React.FC<ImagePaneProps> = ({
                                                 ImageComponent,
                                                 HeaderComponent,
                                                 TextCardComponent,
                                                 Align = AlignEnum.LEFT,
                                                 HeaderMargin = -40,
                                                 ParagraphMargin = -24,
                                                 TextAlign = 'center',
                                                 TextMargin = 0,
                                                 LinkHref,
                                             }) => {
    const isLeft = Align === AlignEnum.LEFT;
    const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);
    const [isTablet, setIsTablet] = useState(window.innerWidth > 768 && window.innerWidth <= 1024);

    // Определяем тип устройства
    useEffect(() => {
        const handleResize = () => {
            const width = window.innerWidth;
            setIsMobile(width <= 768);
            setIsTablet(width > 768 && width <= 1024);
        };

        window.addEventListener('resize', handleResize);
        return () => window.removeEventListener('resize', handleResize);
    }, []);

    const pane =
        <Row gutter={[16, 16]} align="middle" justify="center" style={{
            flexWrap: 'wrap',
            margin: 0,
            width: '100%'
        }}>
            {isLeft && (
                <Col xs={24} md={11} lg={10} style={{
                    textAlign: 'center',
                    marginBottom: isMobile ? '20px' : '0',
                    padding: isMobile ? '0 8px' : '0 16px'
                }}>
                    {ImageComponent}
                </Col>
            )}
            <Col
                xs={24}
                md={isLeft ? 11 : 11}
                lg={isLeft ? 12 : 10}
                style={{
                    zIndex: 1,
                    position: 'relative',
                    padding: isMobile ? '16px 8px' : '8px 16px',
                    borderRadius: 8,
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: TextAlign === 'bottom' ? 'flex-end' : TextAlign === 'top' ? 'flex-start' : 'center',
                    height: '100%',
                }}
            >
                <div style={{
                    marginTop: isMobile || isTablet ? 0 : (TextAlign === 'bottom' ? 0 : TextAlign === 'top' ? TextMargin : 0),
                    marginBottom: isMobile || isTablet ? 0 : (TextAlign === 'top' ? 0 : TextAlign === 'bottom' ? TextMargin : 0),
                }}>
                    <div style={{
                        marginLeft: isMobile || isTablet ? 0 : (isLeft ? Math.min(0, HeaderMargin) : 0),
                        marginRight: isMobile || isTablet ? 0 : (!isLeft ? Math.min(0, HeaderMargin) : 0),
                        textAlign: isMobile ? 'center' : 'inherit'
                    }}>
                        {HeaderComponent}
                    </div>
                    <div style={{
                        marginLeft: isMobile || isTablet ? 0 : (isLeft ? Math.min(0, ParagraphMargin) : 0),
                        marginRight: isMobile || isTablet ? 0 : (!isLeft ? Math.min(0, ParagraphMargin) : 0),
                        textAlign: isMobile ? 'justify' : 'inherit',
                        wordWrap: 'break-word'
                    }}>
                        {TextCardComponent}
                    </div>
                </div>
            </Col>
            {!isLeft && (
                <Col xs={24} md={11} lg={10} style={{
                    textAlign: 'center',
                    marginTop: isMobile ? '20px' : '0',
                    padding: isMobile ? '0 8px' : '0 16px'
                }}>
                    {ImageComponent}
                </Col>
            )}
        </Row>
    return (
        <div style={{ width: '100%', overflow: 'hidden' }}>
            {(LinkHref !== undefined) && (<Link to={LinkHref}>{pane}</Link>)}
            {(LinkHref === undefined) && pane}
        </div>
    );
}

export default ImagePane;
