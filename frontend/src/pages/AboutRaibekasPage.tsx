import React, { useState, useEffect } from 'react';
import { Tabs, Timeline, Spin, Typography, Row, Col, Card } from 'antd';
import { ClockCircleOutlined } from '@ant-design/icons';
import { authorApi } from '../api/strapiClient';
import { Author, TimelineEvent } from '../types';

const { Title, Paragraph } = Typography;
const { TabPane } = Tabs;

const AboutRaibekasPage: React.FC = () => {
  const [author, setAuthor] = useState<Author | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchAuthorData = async () => {
      setLoading(true);
      try {
        const data = await authorApi.getRaibekasInfo();
        setAuthor(data);
      } catch (error) {
        console.error('Ошибка при загрузке информации об авторе:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchAuthorData();
  }, []);

  if (loading) {
    return (
      <div style={{ textAlign: 'center', padding: '40px 0' }}>
        <Spin size="large" />
      </div>
    );
  }

  if (!author) {
    return <div>Информация об авторе не найдена</div>;
  }

  return (
    <div className="about-raibekas-page">
      <Title level={1}>О Райбекасе</Title>

      <Tabs defaultActiveKey="biography">
        <TabPane tab="Биография" key="biography">
          <Row gutter={[24, 24]}>
            <Col span={24} md={16}>
              <Paragraph>{author.bio}</Paragraph>
            </Col>
            <Col span={24} md={8}>
              {/* Здесь может быть фото автора */}
              <Card>
                <div style={{ textAlign: 'center' }}>Фото Райбекаса</div>
              </Card>
            </Col>
          </Row>

          <Title level={3} style={{ marginTop: 32 }}>Основные этапы жизни и творчества</Title>
          <Timeline mode="alternate">
            {author.timeline.map((event: TimelineEvent) => (
              <Timeline.Item
                key={event.id}
                dot={event.year % 10 === 0 ? <ClockCircleOutlined style={{ fontSize: '16px' }} /> : undefined}
              >
                <div className="timeline-event">
                  <h4>{event.year} - {event.title}</h4>
                  <p>{event.description}</p>
                </div>
              </Timeline.Item>
            ))}
          </Timeline>
        </TabPane>

        <TabPane tab="Тексты Райбекаса" key="texts">
          <Paragraph>Основные произведения и тексты автора.</Paragraph>
          {/* Здесь может быть список основных произведений */}
        </TabPane>

        <TabPane tab="О Райбекасе" key="about">
          <Paragraph>Критика, статьи и материалы о Райбекасе.</Paragraph>
          {/* Здесь могут быть критические статьи и материалы */}
        </TabPane>
      </Tabs>
    </div>
  );
};

export default AboutRaibekasPage;