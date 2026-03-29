import XCTest
@testable import CustardKit

final class QwertyEnglishLayoutTest: XCTestCase {
    private func inputKey(_ label: String, input: String? = nil, color: CustardKeyDesign.ColorType = .normal) -> CustardInterfaceKey {
        let input = input ?? label
        return .custom(
            .init(
                design: .init(label: .text(label), color: color),
                press_actions: [.input(input)],
                longpress_actions: .none,
                variations: []
            )
        )
    }

    private func moveTabKey(label: String, tab: TabData, color: CustardKeyDesign.ColorType = .special) -> CustardInterfaceKey {
        .custom(
            .init(
                design: .init(label: .text(label), color: color),
                press_actions: [.moveTab(tab)],
                longpress_actions: .none,
                variations: []
            )
        )
    }

    private func shiftKey() -> CustardInterfaceKey {
        .custom(
            .init(
                design: .init(label: .text("shift"), color: .special),
                press_actions: [.moveTab(.custom("qwerty_english_upper"))],
                longpress_actions: .init(duration: .normal, start: [], repeat: []),
                variations: [
                    .init(
                        type: .flickVariation(.top),
                        key: .init(
                            design: .init(label: .text("caps")),
                            press_actions: [.moveTab(.custom("qwerty_english_caps"))],
                            longpress_actions: .init(duration: .normal, start: [], repeat: [])
                        )
                    )
                ]
            )
        )
    }

    private func deleteKey() -> CustardInterfaceKey {
        .custom(
            .init(
                design: .init(label: .systemImage("delete.left"), color: .special),
                press_actions: [.delete(1)],
                longpress_actions: .init(start: [], repeat: [.delete(1)]),
                variations: []
            )
        )
    }

    func testDecodeLowerLayoutGeometry() throws {
        let target = """
        {
            "identifier": "qwerty_english_lower",
            "language": "en_US",
            "input_style": "direct",
            "metadata": {
                "custard_version": "1.0",
                "display_name": "QWERTY English"
            },
            "interface": {
                "key_layout": {
                    "type": "grid_fit",
                    "row_count": 20,
                    "column_count": 4,
                },
                "key_style": "tenkey_style",
                "keys": [
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 0,
                            "y": 0,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "q"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": "q"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 18,
                            "y": 0,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "p"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": "p"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 1,
                            "y": 1,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "a"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": "a"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 17,
                            "y": 1,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "l"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": "l"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 0,
                            "y": 2,
                            "width": 3,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "shift"
                                },
                                "color": "special"
                            },
                            "press_actions": [
                                {
                                    "type": "move_tab",
                                    "tab_type": "custom",
                                    "identifier": "qwerty_english_upper"
                                }
                            ],
                            "longpress_actions": {
                                "duration": "normal",
                                "start": [],
                                "repeat": []
                            },
                            "variations": [
                                {
                                    "type": "flick_variation",
                                    "direction": "top",
                                    "key": {
                                        "design": {
                                            "label": {
                                                "text": "caps"
                                            }
                                        },
                                        "press_actions": [
                                            {
                                                "type": "move_tab",
                                                "tab_type": "custom",
                                                "identifier": "qwerty_english_caps"
                                            }
                                        ],
                                        "longpress_actions": {
                                            "duration": "normal",
                                            "start": [],
                                            "repeat": []
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 3,
                            "y": 2,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "z"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": "z"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 15,
                            "y": 2,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "m"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": "m"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 17,
                            "y": 2,
                            "width": 3,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "system_image": "delete.left"
                                },
                                "color": "special"
                            },
                            "press_actions": [
                                {
                                    "type": "delete",
                                    "count": 1
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": [
                                    {
                                        "type": "delete",
                                        "count": 1
                                    }
                                ]
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 0,
                            "y": 3,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "123"
                                },
                                "color": "special"
                            },
                            "press_actions": [
                                {
                                    "type": "move_tab",
                                    "tab_type": "system",
                                    "identifier": "qwerty_numbers"
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 2,
                            "y": 3,
                            "width": 2,
                            "height": 1
                        },
                        "key_type": "system",
                        "key": {
                            "type": "change_keyboard"
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 4,
                            "y": 3,
                            "width": 10,
                            "height": 1
                        },
                        "key_type": "custom",
                        "key": {
                            "design": {
                                "label": {
                                    "text": "space"
                                },
                                "color": "normal"
                            },
                            "press_actions": [
                                {
                                    "type": "input",
                                    "text": " "
                                }
                            ],
                            "longpress_actions": {
                                "start": [],
                                "repeat": []
                            },
                            "variations": []
                        }
                    },
                    {
                        "specifier_type": "grid_fit",
                        "specifier": {
                            "x": 16,
                            "y": 3,
                            "width": 4,
                            "height": 1
                        },
                        "key_type": "system",
                        "key": {
                            "type": "enter"
                        }
                    }
                ]
            }
        }
        """

        let decoded: Custard? = Custard.quickDecode(target: target)
        let decoded = try XCTUnwrap(decoded)

        XCTAssertEqual(decoded.interface.keyLayout, .gridFit(.init(rowCount: 20, columnCount: 4)))
        XCTAssertEqual(decoded.interface.keys.count, 12)
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 0, y: 0, width: 2, height: 1))], Optional(inputKey("q")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 18, y: 0, width: 2, height: 1))], Optional(inputKey("p")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 1, y: 1, width: 2, height: 1))], Optional(inputKey("a")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 17, y: 1, width: 2, height: 1))], Optional(inputKey("l")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 0, y: 2, width: 3, height: 1))], Optional(shiftKey()))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 3, y: 2, width: 2, height: 1))], Optional(inputKey("z")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 15, y: 2, width: 2, height: 1))], Optional(inputKey("m")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 17, y: 2, width: 3, height: 1))], Optional(deleteKey()))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 0, y: 3, width: 2, height: 1))], Optional(moveTabKey(label: "123", tab: .system(.qwerty_numbers))))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 2, y: 3, width: 2, height: 1))], Optional(.system(.changeKeyboard)))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 4, y: 3, width: 10, height: 1))], Optional(inputKey("space", input: " ")))
        XCTAssertEqual(decoded.interface.keys[.gridFit(.init(x: 16, y: 3, width: 4, height: 1))], Optional(.system(.enter)))
    }
}
