// Custard

import "strings"

@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
@jsonschema(id="https://github.com/azooKey/CustardKit/json/custard.schema.json")
matchN(1, [#custard, [...#custard]])

#action: matchN(1, [#input_action, #direct_input_action, #delete_action, #move_cursor_action, #move_tab_action, #select_candidate_action, #complete_action, #complete_character_form_action, #replace_last_characters_action, #replace_default_action, #smart_delete_action, #smart_delete_default_action, #smart_move_cursor_action, #enable_resizing_mode_action, #toggle_cursor_bar_action, #toggle_tab_bar_action, #toggle_caps_lock_state_action, #dismiss_keyboard_action, #paste_action, #launch_application_action])

#complete_action: close({
	type!: "complete"
})

#complete_character_form_action: close({
	type!: "complete_character_form"
	forms!: [_, ...] & [..."hiragana" | "katakana" | "halfwidth_katakana" | "uppercase" | "lowercase"]
})

#custard: close({
	identifier!:  strings.MinRunes(1)
	language!:    "ja_JP" | "en_US" | "el_GR" | "undefined" | "none"
	input_style!: "direct" | "roman2kana"
	metadata!:    #metadata
	interface!:   #interface
})

#custom_key: close({
	design!: #key_design
	press_actions!: [...#action]
	longpress_actions!: #longpress_actions
	variations!: [...#variation]
})

#delete_action: close({
	type!:  "delete"
	count!: int
})

#direct_input_action: close({
	type!: "direct_input"
	text!: string
})

#directional_label: matchN(>=1, [{
	left!: _
	...
}, {
	top!: _
	...
}, {
	right!: _
	...
}, {
	bottom!: _
	...
}]) & close({
	left?:   string
	top?:    string
	right?:  string
	bottom?: string
})

#dismiss_keyboard_action: close({
	type!: "dismiss_keyboard"
})

#enable_resizing_mode_action: close({
	type!: "enable_resizing_mode"
})

#flick_variation: close({
	type!:      "flick_variation"
	direction!: "left" | "top" | "right" | "bottom"
	key!:       #variation_key
})

#grid_fit_interface_element: matchN(2, [#interface_element, null | bool | number | string | [...] | {
	specifier_type?: "grid_fit"
	...
}])

#grid_fit_layout: close({
	type!:         "grid_fit"
	row_count!:    int & >=1
	column_count!: int & >=1
})

#grid_fit_specifier: close({
	x!:      int & >=0
	y!:      int & >=0
	width!:  int & >=1
	height!: int & >=1
})

#grid_scroll_interface_element: matchN(2, [#interface_element, null | bool | number | string | [...] | {
	specifier_type?: "grid_scroll"
	...
}])

#grid_scroll_layout: close({
	type!:         "grid_scroll"
	direction!:    "vertical" | "horizontal"
	row_count!:    >0
	column_count!: >0
})

#grid_scroll_specifier: close({
	index!: int & >=0
})

#input_action: close({
	type!: "input"
	text!: string
})

#interface: matchN(4, [matchIf({
	key_layout?: null | bool | number | string | [...] | {
		type!: "grid_fit"
		...
	}
	...
}, {
	keys?: null | bool | number | string | [...#grid_fit_interface_element] | {
		...
	}
	...
}, _) & {
	...
}, matchIf({
	key_layout?: null | bool | number | string | [...] | {
		type!: "grid_scroll"
		...
	}
	...
}, {
	keys?: null | bool | number | string | [...#grid_scroll_interface_element] | {
		...
	}
	...
}, _) & {
	...
}, matchIf({
	key_style?: "tenkey_style"
	...
}, {
	keys?: null | bool | number | string | [...#tenkey_interface_element] | {
		...
	}
	...
}, _) & {
	...
}, matchIf({
	key_style?: "pc_style"
	...
}, {
	keys?: null | bool | number | string | [...#pc_interface_element] | {
		...
	}
	...
}, _) & {
	...
}]) & close({
	key_layout!: #key_layout
	key_style!:  "tenkey_style" | "pc_style"
	keys!: [...#interface_element]
})

#interface_element: matchN(4, [matchIf({
	specifier_type?: "grid_fit"
	...
}, {
	specifier?: #grid_fit_specifier
	...
}, _) & {
	...
}, matchIf({
	specifier_type?: "grid_scroll"
	...
}, {
	specifier?: #grid_scroll_specifier
	...
}, _) & {
	...
}, matchIf({
	key_type?: "system"
	...
}, {
	key?: #system_key
	...
}, _) & {
	...
}, matchIf({
	key_type?: "custom"
	...
}, {
	key?: #custom_key
	...
}, _) & {
	...
}]) & close({
	specifier_type!: "grid_fit" | "grid_scroll"
	specifier!:      _
	key_type!:       "system" | "custom"
	key!:            _
})

#key_design: close({
	label!: #label
	color!: "normal" | "special" | "selected" | "unimportant"
})

#key_layout: matchN(1, [#grid_fit_layout, #grid_scroll_layout])

#label: matchN(1, [close({
	text!: string
}), close({
	system_image!: strings.MinRunes(1)
}), close({
	type!: "main_and_sub"
	main!: string
	sub!:  string
}), close({
	type!:       "main_and_directions"
	main!:       string
	directions!: #directional_label
})])

#launch_application_action: close({
	type!:        "launch_application"
	scheme_type!: "azooKey" | "shortcuts"
	target!:      strings.MinRunes(1)
})

#longpress_actions: close({
	duration?: "normal" | "light"
	start!: [...#action]
	repeat!: [...#action]
})

#longpress_variation: close({
	type!: "longpress_variation"
	key!:  #variation_key
})

#metadata: close({
	custard_version!: "1.0" | "1.1" | "1.2"
	display_name!:    strings.MinRunes(1)
})

#move_cursor_action: close({
	type!:  "move_cursor"
	count!: int
})

#move_tab_action: matchN(1, [close({
	type!:       "move_tab"
	tab_type!:   "system"
	identifier!: "user_japanese" | "user_english" | "flick_japanese" | "flick_english" | "flick_numbersymbols" | "qwerty_japanese" | "qwerty_english" | "qwerty_numbers" | "qwerty_symbols" | "emoji_tab" | "clipboard_history_tab" | "last_tab"
}), close({
	type!:       "move_tab"
	tab_type!:   "custom"
	identifier!: strings.MinRunes(1)
})])

#paste_action: close({
	type!: "paste"
})

#pc_custom_key: matchN(2, [#custom_key, null | bool | number | string | [...] | {
	variations?: [...#longpress_variation]
	...
}])

#pc_interface_element: matchN(2, [#interface_element, matchIf(null | bool | number | string | [...] | {
	key_type?: "custom"
	...
}, null | bool | number | string | [...] | {
	key?: #pc_custom_key
	...
}, _)])

#replace_default_action: close({
	type!:         "replace_default"
	replace_type?: "default" | "dakuten" | "handakuten" | "kogaki"
	fallbacks?: [..."default" | "dakuten" | "handakuten" | "kogaki"]
})

#replace_last_characters_action: close({
	type!: "replace_last_characters"
	table!: [string]: string
})

#select_candidate_action: close({
	type!:      "select_candidate"
	selection!: #selection
})

#selection: matchN(1, [close({
	type!: "first" | "last"
}), close({
	type!:  "offset" | "exact"
	value!: int
})])

#smart_delete_action: close({
	type!:      "smart_delete"
	direction!: "forward" | "backward"
	targets!: [...string]
})

#smart_delete_default_action: close({
	type!: "smart_delete_default"
})

#smart_move_cursor_action: close({
	type!:      "smart_move_cursor"
	direction!: "forward" | "backward"
	targets!: [...string]
})

#system_key: close({
	type!: "change_keyboard" | "enter" | "upper_lower" | "next_candidate" | "flick_kogaki" | "flick_kutoten" | "flick_hira_tab" | "flick_abc_tab" | "flick_star123_tab"
})

#tenkey_custom_key: matchN(2, [#custom_key, null | bool | number | string | [...] | {
	variations?: [...#flick_variation]
	...
}])

#tenkey_interface_element: matchN(2, [#interface_element, matchIf(null | bool | number | string | [...] | {
	key_type?: "custom"
	...
}, null | bool | number | string | [...] | {
	key?: #tenkey_custom_key
	...
}, _)])

#toggle_caps_lock_state_action: close({
	type!: "toggle_caps_lock_state"
})

#toggle_cursor_bar_action: close({
	type!: "toggle_cursor_bar"
})

#toggle_tab_bar_action: close({
	type!: "toggle_tab_bar"
})

#variation: matchN(1, [#flick_variation, #longpress_variation])

#variation_key: close({
	design!: #variation_key_design
	press_actions!: [...#action]
	longpress_actions!: #longpress_actions
})

#variation_key_design: close({
	label!: #label
})
