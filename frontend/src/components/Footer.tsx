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
                    <div className="footer-partners" style={{display: 'flex', justifyContent: 'space-between', maxWidth: '85%'}}>
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
                <Col xs={24} sm={24} md={12} className="footer-contacts-container">
                    <div className="footer-contacts">
                        <Link href="mailto:ithi@sfu-kras.ru" className="contact-item"
                              style={{color: 'black'}}>
                            <MailOutlined style={{marginRight: 8}}/>
                            ithi@sfu-kras.ru
                        </Link>
                        <Link href="tel:+7 (391) 206-26-75" className="contact-item" style={{color: 'black'}}>
                            <PhoneOutlined style={{marginRight: 8}}/>
                            +7 (391) 206-26-75
                        </Link>
                        <Link
                            href={"https://yandex.ru/maps/62/krasnoyarsk/house/svobodny_prospekt_82s1/bUsYcQFnSUAFQFtsfXxxdXRkZQ==/?ll=92.767052%2C56.004871&z=16"}
                            className="contact-item"
                            style={{color: 'black'}}
                        >
                            <EnvironmentOutlined style={{marginRight: 8}}/>
                            пр. Свободный, 82, стр. 1, ауд. 4-40</Link>
                    </div>
                </Col>
            </Row>

            {/* Левый копирайт по вертикали по центру */}
            <Row style={{marginTop: 0, marginBottom: 30}}>
                <Col xs={24} sm={24} md={12}>
                    <div style={{
                        display: 'flex',
                        flexDirection: 'column',
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
                <Col xs={24} sm={24} md={12} className="privacy-policy-container">
                    <Link href="https://sfu.ru/ru/about/privacy-policy" className="privacy-policy-link"
                          style={{color: 'black', fontSize: 12}}>
                        Политика конфиденциальности
                    </Link>
                </Col>
            </Row>
        </AntFooter>
    );
};

// @ts-ignore
export default Footer;