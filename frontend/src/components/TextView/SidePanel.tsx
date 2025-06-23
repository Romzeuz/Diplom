import React, {useState} from 'react';
import {Layout, Image, Drawer, Button, Grid} from 'antd';
import {MenuOutlined} from '@ant-design/icons';
import TableOfContents from './TableOfContents';
import Keywords from './Keywords';
import {Text, TocItem} from '../../types';
import {API_CONFIG} from '../../api/config';

const {Sider} = Layout;
const {useBreakpoint} = Grid;

interface SidePanelProps {
    text: Text;
    tocItems: TocItem[];
    selectedKeyword: string | null;
    onKeywordSelect: (keyword: string | null) => void;
    occurrenceCount: Record<string, number>;
    currentOccurrence: number;
    onPrevOccurrence: () => void;
    onNextOccurrence: () => void;
    changePage: (pageNumber: number) => void;
}

const SidePanelContent: React.FC<SidePanelProps> = ({
                                                        text,
                                                        tocItems,
                                                        selectedKeyword,
                                                        onKeywordSelect,
                                                        occurrenceCount,
                                                        currentOccurrence,
                                                        onPrevOccurrence,
                                                        onNextOccurrence,
                                                        changePage,
                                                    }) => (
    <>
        {text.logo && <Image src={`${API_CONFIG.STRAPI_MEDIA_URL}${text.logo.url.slice(8)}`}
                             alt={text.title}
                             style={{marginBottom: '20px', borderRadius: '8px'}}
                             preview={false}
        />}
        <Keywords
            keywords={text.key_words || []}
            selectedKeyword={selectedKeyword}
            onSelect={onKeywordSelect}
            occurrenceCount={occurrenceCount}
            currentOccurrence={currentOccurrence}
            onPrev={onPrevOccurrence}
            onNext={onNextOccurrence}
        />
        <TableOfContents items={tocItems} changePage={changePage}/>
    </>
);


const SidePanel: React.FC<SidePanelProps> = (props) => {
    const [drawerOpen, setDrawerOpen] = useState(false);
    const screens = useBreakpoint();

    const showDrawer = () => setDrawerOpen(true);
    const closeDrawer = () => setDrawerOpen(false);

    if (!screens.lg) { // On smaller screens (tablets, phones)
        return (
            <>
                <Button
                    type="primary"
                    icon={<MenuOutlined/>}
                    onClick={showDrawer}
                    style={{position: 'fixed', bottom: '24px', right: '24px', zIndex: 10}}
                />
                <Drawer
                    title="Информация"
                    placement="left"
                    onClose={closeDrawer}
                    open={drawerOpen}
                    width={300}
                >
                    <SidePanelContent {...props} />
                </Drawer>
            </>
        );
    }

    return (
        <Sider
            width="30%"
            theme="light"
            style={{
                paddingTop: '32px',
                paddingRight: '24px',
                paddingLeft: '24px',
                borderRadius: '8px',
                position: 'sticky',
                top: '32px',
                height: '100%',
                minHeight: 600,
                overflow: 'auto',
                scrollbarWidth: 'thin',
                scrollbarGutter: 'stable',
            }}
        >
            <SidePanelContent {...props} />
        </Sider>
    );
};

export default SidePanel;

