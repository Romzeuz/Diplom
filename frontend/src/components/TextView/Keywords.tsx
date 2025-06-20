import React from 'react';
import { Typography, Flex, Button, Card } from 'antd';
import { LeftOutlined, RightOutlined } from '@ant-design/icons';

const { Title, Paragraph } = Typography;

interface KeywordsProps {
    keywords: {[key: string]: number[]};
    selectedKeyword: string | null;
    onSelect: (keyword: string | null) => void;
    occurrenceCount: number;
    currentOccurrence: number;
    onPrev: () => void;
    onNext: () => void;
}

const Keywords: React.FC<KeywordsProps> = ({ keywords, selectedKeyword, onSelect, occurrenceCount, currentOccurrence, onPrev, onNext }) => {
    return (
        <>
            <Title level={4}>Ключевые слова</Title>
            {selectedKeyword && (
                <Card size="small" style={{ marginBottom: '16px' }}>
                    <Flex justify="space-between" align="center">
                        <Button size="small" icon={<LeftOutlined />} onClick={onPrev} disabled={occurrenceCount < 2} />
                        <Paragraph style={{ margin: 0 }}>
                            {occurrenceCount > 0 ? `${currentOccurrence + 1} / ${occurrenceCount}` : 'Не найдено'}
                        </Paragraph>
                        <Button size="small" icon={<RightOutlined />} onClick={onNext} disabled={occurrenceCount < 2} />
                    </Flex>
                    <Button type="link" onClick={() => onSelect(null)} style={{ display: 'block', margin: '10px auto 0' }} size="small">
                        Сбросить
                    </Button>
                </Card>
            )}
            <Flex gap="small" wrap="wrap">
                {Object.keys(keywords).map(kw => (
                    <Button
                        key={kw}
                        size="small"
                        type={selectedKeyword === kw ? 'primary' : 'default'}
                        onClick={() => onSelect(kw)}
                    >
                        {kw}
                    </Button>
                ))}
            </Flex>
        </>
    );
};

export default Keywords;
