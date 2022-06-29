import React from "react";
import { Text, Pressable } from "react-native";
import { ButtonProps } from "../models/Button";

export default function Button({ title, onPressed, buttonStyle, textStyle } : ButtonProps) {
	return (
		<Pressable style={buttonStyle} onPress={onPressed} android_ripple={{color: '#810FCC'}}>
			<Text style={textStyle}>
				{title}
			</Text>
		</Pressable>
	)
}