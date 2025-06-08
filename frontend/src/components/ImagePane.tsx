import React from 'react';
import {Row, Col} from 'antd';
import {Link} from "react-router-dom";

export enum AlignEnum {
    LEFT = 'left',
    RIGHT = 'right',
}

interface ImagePaneProps {
    ImageComponent: React.ReactNode;
    HeaderComponent: React.ReactNode;
    TextCardComponent: React.ReactNode;
    Align?: AlignEnum;
    HeaderMargin?: number;
    ParagraphMargin?: number;
    TextAlign?: 'bottom' | 'top' | 'center';
    TextMargin?: number;
    LinkHref?: string;
}

const ImagePane: React.FC<ImagePaneProps> = ({
                                                 ImageComponent,
                                                 HeaderComponent,
                                                 TextCardComponent,
                                                 Align = AlignEnum.LEFT,
                                                 HeaderMargin = -40,
                                                 ParagraphMargin = -24,
                                                 TextAlign = 'center',
                                                 TextMargin = 0,
                                                 LinkHref,
                                             }) => {
    const isLeft = Align === AlignEnum.LEFT;
    const pane =
        <Row gutter={[24, 24]} align="middle" justify="center">
            {isLeft && (
                <Col style={{marginRight: 48}}>{ImageComponent}</Col>
            )}
            <Col
                style={{
                    zIndex: 1,
                    position: 'relative',
                    padding: '8px 0',
                    borderRadius: 8,
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: TextAlign === 'bottom' ? 'flex-end' : TextAlign === 'top' ? 'flex-start' : 'center',
                    height: '100%',
                }}
            >
                <div style={{
                    marginTop: TextAlign === 'bottom' ? 0 : TextAlign === 'top' ? TextMargin : 0,
                    marginBottom: TextAlign === 'top' ? 0 : TextAlign === 'bottom' ? TextMargin : 0,
                }}>
                    <div style={{
                        marginLeft: isLeft ? HeaderMargin : 0,
                        marginRight: !isLeft ? HeaderMargin : 0
                    }}>
                        {HeaderComponent}
                    </div>
                    <div style={{
                        marginLeft: isLeft ? ParagraphMargin : 0,
                        marginRight: !isLeft ? ParagraphMargin : 0
                    }}>
                        {TextCardComponent}
                    </div>
                </div>
            </Col>
            {!isLeft && (
                <Col style={{marginLeft: 48}}>{ImageComponent}</Col>
            )}
        </Row>
    return (
        <>
            {(LinkHref !== undefined) && (<Link to={LinkHref}>{pane}</Link>)}
            {(LinkHref === undefined) && pane}
        </>
    );
}

export default ImagePane;
