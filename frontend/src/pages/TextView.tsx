import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { Typography, Spin, Tooltip, Popover, Button } from 'antd';
import ReactMarkdown from 'react-markdown';
import { textApi } from '../api/strapiClient';
import { aiApi } from '../api/aiClient';
import { Text, AIExplanation } from '../types';
import { InfoCircleOutlined } from '@ant-design/icons';

const { Title, Paragraph } = Typography;

const TextView: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const [text, setText] = useState<Text | null>(null);
  const [loading, setLoading] = useState(true);
  const [selectedText, setSelectedText] = useState('');
  const [explanation, setExplanation] = useState<AIExplanation | null>(null);
  const [explainLoading, setExplainLoading] = useState(false);

  useEffect(() => {
    const fetchText = async () => {
      if (!id) return;

      setLoading(true);
      try {
        const data = await textApi.getText(parseInt(id));
        setText(data);

        // Получаем контекстные ссылки для текста
        const links = await aiApi.getContextualLinks(data.content);
        // Здесь можно обработать полученные ссылки
      } catch (error) {
        console.error('Ошибка при загрузке текста:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchText();
  }, [id]);

  const handleTextSelection = () => {
    const selection = window.getSelection();
    if (selection && selection.toString().length > 0) {
      setSelectedText(selection.toString());
    }
  };

  const handleExplain = async () => {
    if (!selectedText) return;

    setExplainLoading(true);
    try {
      const data = await aiApi.getExplanation(selectedText);
      setExplanation(data);
    } catch (error) {
      console.error('Ошибка при получении объяснения:', error);
    } finally {
      setExplainLoading(false);
    }
  };

  if (loading) {
    return (
      <div style={{ textAlign: 'center', padding: '40px 0' }}>
        <Spin size="large" />
      </div>
    );
  }

  if (!text) {
    return <div>Текст не найден</div>;
  }

  const ExplanationPopover = () => (
    <Popover
      visible={!!selectedText && !!explanation}
      content={
        <div>
          {explainLoading ? (
            <Spin size="small" />
          ) : (
            <div>
              <Paragraph>{explanation?.explanation}</Paragraph>
              {explanation?.links && explanation.links.length > 0 && (
                <ul>
                  {explanation.links.map((link, index) => (
                    <li key={index}>{link}</li>
                  ))}
                </ul>
              )}
            </div>
          )}
        </div>
      }
      title="Объяснение"
      trigger="click"
    >
      <Button
        type="primary"
        size="small"
        onClick={handleExplain}
        disabled={!selectedText}
        style={{ display: selectedText ? 'inline-block' : 'none' }}
      >
        Объяснить
      </Button>
    </Popover>
  );

  return (
    <div className="text-view">
      <Title level={1}>{text.title}</Title>
      <Paragraph type="secondary">Автор: {text.author}</Paragraph>

      <div className="text-tools">
        <ExplanationPopover />
      </div>

      <div
        className="text-content"
        onMouseUp={handleTextSelection}
      >
        <ReactMarkdown
          children={text.content}
          components={{
            // Кастомный рендеринг компонентов Markdown
            // Например, для автоматических гиперссылок и тултипов
            a: ({ node, ...props }) => (
              <Tooltip title="Контекстная ссылка">
                <a {...props} target="_blank" rel="noopener noreferrer">
                  {props.children} <InfoCircleOutlined />
                </a>
              </Tooltip>
            ),
          }}
        />
      </div>
    </div>
  );
};

export default TextView;