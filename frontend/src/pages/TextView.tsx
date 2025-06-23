import '@ant-design/v5-patch-for-react-19';
import React, {useState, useEffect, useRef} from 'react';
import {useParams} from 'react-router-dom';
import {Typography, Spin, Tooltip, Layout, Flex, Tag} from 'antd';
import ReactMarkdown from 'react-markdown';
import rehypeRaw from 'rehype-raw';
import {textApi} from '../api/strapiClient';
import {Text, TocItem, Page} from '../types';
import {BookOutlined, InfoCircleOutlined, TagOutlined, UserOutlined} from '@ant-design/icons';
import SidePanel from '../components/TextView/SidePanel';
import {Pagination} from 'antd';
import "./TextView.css";
import keywords from "../components/TextView/Keywords";

const {Title, Paragraph} = Typography;
const {Content} = Layout;

const TextView: React.FC = () => {
    const {id} = useParams<{ id: string }>();
    const [text, setText] = useState<Text | null>(null);
    const [page, setPage] = useState<Page | null>(null)
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [loading, setLoading] = useState(true);
    const [selectedKeyword, setSelectedKeyword] = useState<string | null>(null);
    const [occurrenceCounts, setOccurrenceCounts] = useState({} as Record<string, number>);
    const [currentOccurrence, setCurrentOccurrence] = useState(0);
    const markdownRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        if (page?.text && text?.key_words) {
            const newCounts: Record<string, number> = {};
            Object.keys(text.key_words).forEach(keyword => {
                const regex = new RegExp(keyword, 'gi');
                const matches = page.text.match(regex);
                newCounts[keyword] = matches ? matches.length : 0;
            });
            setOccurrenceCounts(newCounts);
        }
    }, [page, text]);

    const handlePrevOccurrence = () => {
        if (!selectedKeyword) return;
        if (currentPage > 1 && currentOccurrence < 1) {
            setCurrentPage(prev => prev - 1);
        }
        setCurrentOccurrence(prev => (prev > 0 ? prev - 1 : occurrenceCounts[selectedKeyword] - 1));
    };

    const handleNextOccurrence = () => {
        if (!selectedKeyword) return;
        setCurrentOccurrence(prev => (prev < occurrenceCounts[selectedKeyword] - 1 ? prev + 1 : 0));
    };

    useEffect(() => {
        const fetchText = async () => {
            if (!id) return;

            setLoading(true);
            try {
                const data = await textApi.getText(id);
                setText(data);
            } catch (error) {
                console.error('Ошибка при загрузке текста:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchText();
    }, [id]);

    console.log('fetchText called with id:', id, text);

    useEffect(() => {
        const fetchPage = async () => {
            if (!id) return;

            setLoading(true);
            try {
                const data = await textApi.getPages(id, currentPage);
                setPage(data.data);
                console.log('Fetched page:', data.data, data.meta);
                setTotalPages(data.meta.pageCount);
            } catch (error) {
                console.error('Ошибка при загрузке страницы:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchPage();
    }, [id, currentPage]);

    const handlePageChange = (page: number) => {
        setCurrentPage(page);
        markdownRef.current?.scrollIntoView({behavior: 'smooth'});
    };

    const handleKeywordSelect = (keyword: string | null) => {
        if (selectedKeyword === keyword || keyword === null) {
            setSelectedKeyword(null);
            setCurrentOccurrence(0);
        } else {
            setSelectedKeyword(keyword);
        }
    };

    if (loading) {
        return (
            <div style={{textAlign: 'center', padding: '40px 0'}}>
                <Spin size="large"/>
            </div>
        );
    }

    if (!text) {
        return <div>Текст не найден</div>;
    }

    let keywordOccurrenceIndex = 0;

    const markdownComponents = {
        p: ({node, ...props}: any) => {
            if (!selectedKeyword) {
                return <p {...props} />;
            }

            const children = React.Children.toArray(props.children);

            const newChildren = children.map((child: any) => {
                if (typeof child === 'string') {
                    const regex = new RegExp(`(${selectedKeyword})`, 'gi');
                    const parts = child.split(regex);
                    return parts.map((part, i) => {
                        if (part.toLowerCase() === selectedKeyword.toLowerCase()) {
                            const currentIndex = keywordOccurrenceIndex;
                            const isCurrent = currentIndex === currentOccurrence;
                            keywordOccurrenceIndex++;
                            return (
                                <span
                                    key={i}
                                    id={`keyword-occurrence-${currentIndex}`}
                                    style={{
                                        backgroundColor: isCurrent ? 'yellow' : '#dbeafe',
                                        borderRadius: '3px',
                                        padding: '2px 4px',
                                        fontWeight: isCurrent ? 'bold' : 'normal',
                                    }}
                                >
                                    {part}
                                </span>
                            );
                        }
                        return part;
                    });
                }
                return child;
            });

            return <p>{newChildren}</p>;
        },
        a: ({node, ...props}: any) => (
            <Tooltip title="Контекстная ссылка">
                <a {...props} target="_blank" rel="noopener noreferrer">
                    {props.children} <InfoCircleOutlined/>
                </a>
            </Tooltip>
        ),
    };

    return (
        <div className="text-view">
            <Flex align="center" gap={20} style={{marginBottom: '16px', padding: '0 24px'}}>
                <BookOutlined style={{fontSize: '36px'}}/>
                <Title level={3} style={{margin: 0}}>{text.title}</Title>
            </Flex>
            <Layout style={{background: 'transparent'}}>
                <SidePanel
                    text={text}
                    tocItems={text.table_of_contents}
                    selectedKeyword={selectedKeyword}
                    onKeywordSelect={handleKeywordSelect}
                    occurrenceCount={occurrenceCounts}
                    currentOccurrence={currentOccurrence}
                    onPrevOccurrence={handlePrevOccurrence}
                    onNextOccurrence={handleNextOccurrence}
                    changePage={handlePageChange}
                />
                <Content style={{
                    padding: '0 24px',
                    paddingTop: 32,
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: 'space-between',
                    minHeight: 'calc(100vh - 230px)'
                }}>
                    <div>
                        <Paragraph style={{fontWeight: 400, marginBottom: '24px', fontSize: '24px'}}>
                            <div style={{display: 'flex', alignItems: 'flex-start'}}>
                                <UserOutlined style={{fontSize: '36px', marginRight: '20px'}}/>
                                <div>
                                    {text.authors?.map(
                                        (author, index) => (
                                            <span key={author.id}>
                                        {author.name}{index < text.authors.length - 1 ? ', ' : ''}
                                    </span>
                                        )
                                    )}
                                </div>
                            </div>
                        </Paragraph>

                        <div className="tag-container"
                             style={{fontWeight: 400, marginBottom: '60px', fontSize: '24px'}}>
                            <div style={{display: 'flex', alignItems: 'flex-start'}}>
                                <TagOutlined style={{fontSize: '36px', marginRight: '20px'}}/>
                                <div>
                                    {text.tags.map(tag => (
                                        <Tag key={tag.id} className="tag">{tag.title}</Tag>
                                    ))}
                                </div>
                            </div>
                        </div>

                        <Paragraph style={{marginBottom: '60px'}}>
                            <div style={{display: 'flex', alignItems: 'flex-start'}}>
                                <div style={{fontWeight: 400, fontStyle: 'italic'}}>
                                    {text.annotation}
                                </div>
                            </div>
                        </Paragraph>

                        <div className="markdown-content" ref={markdownRef}>
                            <ReactMarkdown
                                children={page?.text || ''}
                                components={markdownComponents}
                                rehypePlugins={[rehypeRaw]}
                            />
                        </div>
                    </div>
                    <Pagination
                        current={currentPage}
                        total={totalPages}
                        pageSize={1}
                        onChange={handlePageChange}
                        showSizeChanger={false}
                        style={{marginTop: '16px', textAlign: 'center', justifyContent: 'center'}}
                    />
                </Content>
            </Layout>
        </div>
    );
};

export default TextView;
