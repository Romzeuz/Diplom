import React from 'react';
import { Row, Col, Card, Button, Typography, Divider } from 'antd';
import { Link } from 'react-router-dom';

const { Title, Paragraph } = Typography;

const HomePage: React.FC = () => {
  return (
    <div className="home-page">
      <Row gutter={[24, 24]} style={{ marginTop: 24 }}>
        <Col span={24}>
          <Title level={1}>Проект Райбекас</Title>
          <Paragraph>
            Исследование и сохранение литературного наследия с использованием
            современных технологий и искусственного интеллекта.
          </Paragraph>
        </Col>

        {/* Превью блок "О Райбекасе" */}
        <Col xs={24} md={8}>
          <Card
            title="О Райбекасе"
            bordered={false}
            hoverable
            style={{ height: 300 }}
          >
            <Paragraph>
              Биография, основные работы и вклад в литературу.
              Интерактивный таймлайн жизни и творчества.
            </Paragraph>
            <Link to="/about-raibekas">
              <Button type="primary">Подробнее</Button>
            </Link>
          </Card>
        </Col>

        {/* Превью блок "Коллекция" */}
        <Col xs={24} md={8}>
          <Card
            title="Коллекция"
            bordered={false}
            hoverable
            style={{ height: 300 }}
          >
            <Paragraph>
              Архив текстов и произведений с удобной навигацией,
              возможностью поиска и фильтрации по категориям.
            </Paragraph>
            <Link to="/collection">
              <Button type="primary">К коллекции</Button>
            </Link>
          </Card>
        </Col>

        {/* Превью блок "О проекте" */}
        <Col xs={24} md={8}>
          <Card
            title="О проекте"
            bordered={false}
            hoverable
            style={{ height: 300 }}
          >
            <Paragraph>
              Цели проекта, используемые технологии и информация о команде,
              партнёрах и благодарностях.
            </Paragraph>
            <Button type="primary">Узнать больше</Button>
          </Card>
        </Col>

        <Col span={24}>
          <Divider />
          <Title level={2}>Информация о проекте</Title>
          <Paragraph>
            Проект посвящен сохранению и популяризации литературного наследия Райбекаса.
            Мы используем современные технологии для создания интерактивного архива
            текстов с возможностями искусственного интеллекта для углубленного анализа.
          </Paragraph>

          <Title level={3}>Технологии</Title>
          <Paragraph>
            Проект построен с использованием React, TypeScript, AntDesign для фронтенда,
            Strapi CMS для управления контентом и FastAPI для AI-функциональности.
          </Paragraph>

          <Title level={3}>Команда</Title>
          <Row gutter={[16, 16]}>
            {/* Здесь может быть компонент с карточками членов команды */}
            <Col span={24}>
              <Paragraph>
                Над проектом работает команда разработчиков, исследователей литературы и экспертов.
              </Paragraph>
            </Col>
          </Row>
        </Col>
      </Row>
    </div>
  );
};

export default HomePage;