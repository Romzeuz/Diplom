import React from 'react';
import {Typography, Flex, Button, Card, Select} from 'antd';
import {LeftOutlined, RightOutlined} from '@ant-design/icons';

const {Title, Paragraph} = Typography;

interface KeywordsProps {
    keywords: { [key: string]: number[] };
    selectedKeyword: string | null;
    onSelect: (keyword: string | null) => void;
    occurrenceCount: Record<string, number>;
    currentOccurrence: number;
    onPrev: () => void;
    onNext: () => void;
}

const Keywords: React.FC<KeywordsProps> = ({
                                               keywords,
                                               selectedKeyword,
                                               onSelect,
                                               occurrenceCount,
                                               currentOccurrence,
                                               onPrev,
                                               onNext
                                           }) => {
    return (
        <>
            <Title level={4}>Ключевые слова</Title>
            <Select
                options={Object.keys(keywords).map(kw => ({label: kw, value: kw}))}
                value={selectedKeyword || undefined}
                onChange={onSelect}
                style={{width: '100%'}}
                placeholder="Поиск ключевых слов"
            />
            {selectedKeyword && (
                <Card size="small" style={{marginBottom: '16px'}}>
                    <Flex justify="space-between" align="center">
                        <Button size="small" icon={<LeftOutlined/>} onClick={onPrev}
                                disabled={occurrenceCount[selectedKeyword] < 2}/>
                        <Paragraph style={{margin: 0}}>
                            {occurrenceCount[selectedKeyword] > 0 ?
                                `${currentOccurrence + 1} / ${occurrenceCount}` : 'Не найдено'}
                        </Paragraph>
                        <Button size="small" icon={<RightOutlined/>} onClick={onNext}
                                disabled={occurrenceCount[selectedKeyword] < 2}/>
                    </Flex>
                </Card>
            )}
        </>
    );
};

export default Keywords;
