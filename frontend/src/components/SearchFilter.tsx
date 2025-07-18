import React, { useState, useEffect } from 'react';
import { Input, Select, Row, Col } from 'antd';
import { SearchOutlined } from '@ant-design/icons';
import useDebounce from '../hooks/useDebounce';
import {Tag} from "../types";
import "./SearchFilter.css"

const { Search } = Input;
const { Option } = Select;

interface SearchFilterProps {
  onSearch: (value: string) => void;
  onTagsChange: (tags: string[]) => void;
  availableTags: Tag[];
}

const SearchFilter: React.FC<SearchFilterProps> = ({
  onSearch,
  onTagsChange,
  availableTags
}) => {
  const [searchValue, setSearchValue] = useState('');
  const debouncedSearchValue = useDebounce(searchValue, 500);

  const handleSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearchValue(e.target.value);
  };

  // Обработчик для кнопки поиска - мгновенный поиск без debounce
  const handleButtonSearch = (value: string) => {
    // Если значение пустое, берем текущее значение из состояния
    onSearch(value || searchValue);
  };

  // При изменении дебаунсированного значения вызываем onSearch
  useEffect(() => {
    onSearch(debouncedSearchValue);
  }, [debouncedSearchValue]);

  return (
    <div className="search-filter">
      <Row gutter={16}>
        <Col xs={24} md={16} className="search-col">
          <Search
            placeholder="Поиск по названию или содержанию"
            allowClear
            enterButton={<SearchOutlined />}
            size="large"
            value={searchValue}
            onChange={handleSearchChange}
            onSearch={handleButtonSearch} // Используем отдельный обработчик
          />
        </Col>
        <Col xs={24} md={8} className="search-col">
          <Select
            mode="multiple"
            style={{ width: '100%' }}
            placeholder="Фильтр по тегам"
            onChange={onTagsChange}
            size="large"
          >
            {availableTags.map(tag => (
              <Option key={tag.documentId} value={tag.documentId}>{tag.title}</Option>
            ))}
          </Select>
        </Col>
      </Row>
    </div>
  );
};

export default SearchFilter;