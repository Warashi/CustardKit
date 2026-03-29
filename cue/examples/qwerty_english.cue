[
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
        "column_count": 4
      },
      "key_style": "tenkey_style",
      "keys": [
        for i, ch in ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2,
            "y": 0,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
              }
            ],
            "longpress_actions": {
              "start": [],
              "repeat": []
            },
            "variations": []
          }
        },
        for i, ch in ["a", "s", "d", "f", "g", "h", "j", "k", "l"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2 + 1,
            "y": 1,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
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
        for i, ch in ["z", "x", "c", "v", "b", "n", "m"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2 + 3,
            "y": 2,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
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
  },
  {
    "identifier": "qwerty_english_upper",
    "language": "en_US",
    "input_style": "direct",
    "metadata": {
      "custard_version": "1.0",
      "display_name": "QWERTY English Shift"
    },
    "interface": {
      "key_layout": {
        "type": "grid_fit",
        "row_count": 20,
        "column_count": 4
      },
      "key_style": "tenkey_style",
      "keys": [
        for i, ch in ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2,
            "y": 0,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
              },
              {
                "type": "move_tab",
                "tab_type": "custom",
                "identifier": "qwerty_english_lower"
              }
            ],
            "longpress_actions": {
              "start": [],
              "repeat": []
            },
            "variations": []
          }
        },
        for i, ch in ["A", "S", "D", "F", "G", "H", "J", "K", "L"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2 + 1,
            "y": 1,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
              },
              {
                "type": "move_tab",
                "tab_type": "custom",
                "identifier": "qwerty_english_lower"
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
                "identifier": "qwerty_english_lower"
              }
            ],
            "longpress_actions": {
              "start": [],
              "repeat": []
            },
            "variations": []
          }
        },
        for i, ch in ["Z", "X", "C", "V", "B", "N", "M"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2 + 3,
            "y": 2,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
              },
              {
                "type": "move_tab",
                "tab_type": "custom",
                "identifier": "qwerty_english_lower"
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
  },
  {
    "identifier": "qwerty_english_caps",
    "language": "en_US",
    "input_style": "direct",
    "metadata": {
      "custard_version": "1.0",
      "display_name": "QWERTY English CAPS"
    },
    "interface": {
      "key_layout": {
        "type": "grid_fit",
        "row_count": 20,
        "column_count": 4
      },
      "key_style": "tenkey_style",
      "keys": [
        for i, ch in ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2,
            "y": 0,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
              }
            ],
            "longpress_actions": {
              "start": [],
              "repeat": []
            },
            "variations": []
          }
        },
        for i, ch in ["A", "S", "D", "F", "G", "H", "J", "K", "L"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2 + 1,
            "y": 1,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
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
                "identifier": "qwerty_english_lower"
              }
            ],
            "longpress_actions": {
              "start": [],
              "repeat": []
            },
            "variations": []
          }
        },
        for i, ch in ["Z", "X", "C", "V", "B", "N", "M"] {
          "specifier_type": "grid_fit",
          "specifier": {
            "x": i * 2 + 3,
            "y": 2,
            "width": 2,
            "height": 1
          },
          "key_type": "custom",
          "key": {
            "design": {
              "label": {
                "text": ch
              },
              "color": "normal"
            },
            "press_actions": [
              {
                "type": "input",
                "text": ch
              },
              {
                "type": "move_tab",
                "tab_type": "custom",
                "identifier": "qwerty_english_lower"
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
]
