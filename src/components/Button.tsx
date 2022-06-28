import React from "react";
import { Text, TouchableOpacity } from "react-native";

interface Props {
	title: string,
	onPressed: () => void,
	buttonStyle: {},
	textStyle: {}
}

export default function Button({ title, onPressed, buttonStyle, textStyle } : Props) {
	return (
		<TouchableOpacity style={buttonStyle} onPress={onPressed} activeOpacity={0.85}>
			<Text style={textStyle}>
				{title}
			</Text>
		</TouchableOpacity>
	)
}