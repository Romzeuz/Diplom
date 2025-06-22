import React from 'react';
import {Layout, Row, Col, Divider, Space} from 'antd';
import {Typography} from 'antd';
import './Footer.css';
import {EnvironmentOutlined, MailOutlined, PhoneOutlined} from "@ant-design/icons";

const {Footer: AntFooter} = Layout;
const {Text, Link} = Typography;

const Footer: React.FC = () => {
    return (
        <AntFooter className="footer">
            <Row gutter={[24, 24]}>
                {/* Левая колонка - Логотипы партнеров */}
                <Col xs={24} sm={24} md={12}>
                    <div className="footer-partners" style={{display: 'flex', justifyContent: 'center'}}>
                        <div className="partner-logo">
                            <img src="/Белый лого_СФУ.svg" alt="Логотип СФУ" className="partner-image"/>
                        </div>
                        <div className="partner-logo">
                            <img src="/Белый лого_ГИ.svg" alt="Логотип ГИ" className="partner-image"/>
                        </div>
                        <div className="partner-logo">
                            <img src="/Белый лого_ИЦГИ.svg" alt="Логотип ИЦГИ" className="partner-image"/>
                        </div>
                    </div>
                </Col>

                {/* Правая колонка - Контактная информация */}
                <Col xs={24} sm={24} md={12} style={{display: 'flex', justifyContent: 'center'}}>
                    <div className="footer-contacts">
                        <Link href="mailto:contact@raibekas-project.org" className="contact-item"
                              style={{color: 'black'}}>
                            <MailOutlined style={{marginRight: 8}}/>
                            contact@raibekas-project.org
                        </Link>
                        <Link href="tel:+71234567890" className="contact-item" style={{color: 'black'}}>
                            <PhoneOutlined style={{marginRight: 8}}/>
                            +7 (123) 456-78-90
                        </Link>
                        <Link
                            href={"https://www.figma.com/design/Dwo0AXPO4HFUpB5q6ZU3vo/%D0%A0%D0%B0%D0%B9%D0%B1%D0%B5%D0%BA%D0%B0%D1%81?node-id=226-338&t=WQ0b4hpUleebs89y-4"}
                            className="contact-item"
                            style={{color: 'black'}}
                        >
                            <EnvironmentOutlined style={{marginRight: 8}}/>
                            г. Москва, ул.
                            Примерная, д. 123</Link>
                    </div>
                </Col>
            </Row>

            {/* Левый копирайт по вертикали по центру */}
            <Row style={{marginTop: 0, marginBottom: 30}}>
                <Col xs={24} sm={24} md={12}>
                    <div style={{
                        display: 'flex',
                        flexDirection: 'column',
                        paddingLeft: 90
                    }} className="copyright-text-container">
                        <Text
                            className="copyright-text"
                            style={{
                                display: 'block',
                                color: 'black',
                            }}
                        >
                            © {new Date().getFullYear()} Сибирский федеральный университет, Гуманитарный институт <br/>
                            Кафедра информационных технологий в креативных и культурных индустриях<br/>
                            При использовании текстовых и графических материалов ссылка на сайт обязательна
                        </Text>
                    </div>
                </Col>
                <Col xs={24} sm={24} md={12}
                     style={{display: 'flex', justifyContent: 'center', alignItems: 'flex-end'}}>
                    <Link href="/privacy-policy" className="privacy-policy-link"
                          style={{color: 'black', marginRight: 30, fontSize: 12}}>
                        Политика конфиденциальности
                    </Link>
                </Col>
            </Row>
        </AntFooter>
    );
};

// @ts-ignore
export default Footer;