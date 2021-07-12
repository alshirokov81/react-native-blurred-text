import React from 'react';
import { requireNativeComponent, ViewStyle, TextStyle, Platform } from 'react-native';

type BlurredTextProps = {
  value: string | undefined,
  style?: ViewStyle| TextStyle | undefined;
  blurr: number | undefined;
};

export const BlurredTextViewManager = requireNativeComponent<BlurredTextProps>(
'BlurredTextView'
);

const BlurredText = ({blurr = 0,...props}: BlurredTextProps) => {
  const blurrValAdjustedToOS = Platform.select({
    android: blurr*4,
    ios: blurr,
  });
  return (
    <BlurredTextViewManager
      blurr={blurrValAdjustedToOS}
      {...props}
    />
  );
};

export default BlurredText;