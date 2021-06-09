import React from 'react';
import { requireNativeComponent, ViewStyle, Platform } from 'react-native';

type BlurredTextProps = {
  value: string | undefined,
  style?: ViewStyle | undefined;
  blurr: number | undefined;
};

export const BlurredTextViewManager = requireNativeComponent<BlurredTextProps>(
'BlurredTextView'
);

const BlurredText = ({blurr = 0,...props}: BlurredTextProps) => {
  const blurrValAdjustedToOS = Platform.select({
    android: blurr,
    ios: blurr*0.65,
  });
  return (
    <BlurredTextViewManager
      blurr={blurrValAdjustedToOS}
      {...props}
    />
  );
};

export default BlurredText;