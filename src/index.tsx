import React from 'react';
import { requireNativeComponent, ViewStyle, Platform } from 'react-native';

type BlurredTextProps = {
  color: string;
  style: ViewStyle;
};

export const BlurredTextViewManager = requireNativeComponent<BlurredTextProps>(
'BlurredTextView'
);

const BlurredText = ({blurrVal, ...props}: {blurrVal: number}) => {
  const blurrValAdjustedToOS = Platform.select({
    android: blurrVal,
    ios: blurrVal*0.65,
  });
  return (<BlurredTextViewManager
    blurrVal={blurrValAdjustedToOS}
    {...props}
  />);
};

export default BlurredText;
