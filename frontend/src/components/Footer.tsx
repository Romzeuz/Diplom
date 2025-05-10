import React from 'react';
import { Layout, Row, Col, Typography } from 'antd';

const { Footer: AntFooter } = Layout;
const { Text, Link } = Typography;

const Footer: React.FC = () => {
  return (
    <AntFooter style={{ textAlign: 'center' }}>
      <Row gutter={[16, 16]}>
        <Col span={24}>
          <Text>© {new Date().getFullYear()} Проект Райбекас. Все права защищены.</Text>
        </Col>
        <Col span={24}>
          <Text>
            Материалы доступны под лицензией{' '}
            <Link href="https://creativecommons.org/licenses/by-sa/4.0/" target="_blank">
              Creative Commons Attribution-ShareAlike 4.0
            </Link>
          </Text>
        </Col>
        <Col span={24}>
          <Link href="mailto:contact@raibekas-project.org">contact@raibekas-project.org</Link>
        </Col>
      </Row>
    </AntFooter>
  );
};

export default Footer;