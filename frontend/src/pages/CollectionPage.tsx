import React, { useState, useEffect } from 'react';
import { Row, Col, Spin, Empty, Pagination } from 'antd';
import { textApi } from '../api/strapiClient';
import { Text } from '../types';
import TextCard from '../components/TextCard';
import SearchFilter from '../components/SearchFilter';
import './CollectionPage.css';

const CollectionPage: React.FC = () => {
  const [texts, setTexts] = useState<Text[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedTags, setSelectedTags] = useState<string[]>([]);
  const [pagination, setPagination] = useState({
    current: 1,
    pageSize: 12,
    total: 0
  });

  // Все доступные теги (в реальном приложении можно получать с сервера)
  const availableTags = ['поэзия', 'проза', 'критика', 'философия'];

  useEffect(() => {
    const fetchTexts = async () => {
      setLoading(true);
      try {
        const params: {
          search?: string;
          tags?: string[];
          page?: number;
          pageSize?: number;
        } = {
          page: pagination.current,
          pageSize: pagination.pageSize
        };

        if (searchQuery) params.search = searchQuery;
        if (selectedTags.length > 0) params.tags = selectedTags;

        // Предполагаем, что API возвращает метаданные о пагинации
        const response = await textApi.getTexts();
        setTexts(response.data);
        console.log(response);

        // В реальном приложении получаем общее количество из ответа API
        // setPagination(prev => ({ ...prev, total: response.meta.total }));
        if (response.meta.total !== pagination.total)
          setPagination(prev => ({ ...prev, total: response.meta.total }));
      } catch (error) {
        console.error('Ошибка при загрузке текстов:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchTexts();
  }, [searchQuery, selectedTags, pagination.current, pagination.pageSize]);

  const handleSearch = (value: string) => {
    setSearchQuery(value);
    setPagination(prev => ({ ...prev, current: 1 })); // Сбрасываем пагинацию
  };

  const handleTagsChange = (value: string[]) => {
    setSelectedTags(value);
    setPagination(prev => ({ ...prev, current: 1 })); // Сбрасываем пагинацию
  };

  const handlePaginationChange = (page: number, pageSize?: number) => {
    setPagination(prev => ({
      ...prev,
      current: page,
      pageSize: pageSize || prev.pageSize
    }));
  };

  return (
    <div className="collection-page">
      <h1>Коллекция текстов</h1>

      <SearchFilter
        onSearch={handleSearch}
        onTagsChange={handleTagsChange}
        availableTags={availableTags}
      />

      {loading ? (
        <div style={{ textAlign: 'center', padding: '40px 0' }}>
          <Spin size="large" />
        </div>
      ) : texts.length > 0 ? (
        <>
          <div className="masonry-grid" style={{ marginTop: 24, marginBottom: 24 }}>
            {texts.map(text => (
              <div className="masonry-item" key={text.id}>
                <TextCard text={text} />
              </div>
            ))}
          </div>

          <Row justify="center">
            <Col>
              <Pagination
                current={pagination.current}
                pageSize={pagination.pageSize}
                total={pagination.total}
                onChange={handlePaginationChange}
                showSizeChanger
                showTotal={(total) => `Всего ${total} текстов`}
              />
            </Col>
          </Row>
        </>
      ) : (
        <Empty description="Тексты не найдены" />
      )}
    </div>
  );
};

export default CollectionPage;
