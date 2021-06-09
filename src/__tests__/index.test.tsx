import React from 'react';
import renderer from 'react-test-renderer';
import { Platform } from 'react-native';
import RNBlurredText from '../index';

describe('<RNBlurredText />', () => {
  const testText = 'Blurred text';
  const textSize = 20;
  const blurrVal = 4;
  const textColor= 'rgb(20,200,220)';

  it('Should display text for android', () => {
    Platform.select=jest.fn().mockImplementation((obj) => obj.android);

    const testRenderer = renderer.create(
      <RNBlurredText
      textVal={testText}
      textSize={textSize}
      blurrVal={blurrVal}
      textColor={textColor}
      />
    );
    expect (testRenderer.toJSON()).toMatchSnapshot();
  });

  it('Should display text for ios', () => {
    Platform.select=jest.fn().mockImplementation((obj) => obj.ios);

    const testRenderer = renderer.create(
      <RNBlurredText
      textVal={testText}
      textSize={textSize}
      blurrVal={blurrVal}
      textColor={textColor}
      />
    );
    expect (testRenderer.toJSON()).toMatchSnapshot();
  });
});

