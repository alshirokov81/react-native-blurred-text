import React from 'react';
// @ts-ignore
import renderer from 'react-test-renderer';
import { Platform, StyleSheet } from 'react-native';
import RNBlurredText from '../index';

const styles = StyleSheet.create({
    textStyle: {
        fontSize: 20,
        color: 'rgb(20,200,220)',
    }
});

describe('<RNBlurredText />', () => {
  const testText = 'Blurred text';
  const blurrVal = 4;

  it('Should display text for android', () => {
    Platform.select=jest.fn().mockImplementation((obj) => obj.android);

    const testRenderer = renderer.create(
      <RNBlurredText
        style={styles.textStyle}
        value={testText}
        blurr={blurrVal}
      />
    );
    expect (testRenderer.toJSON()).toMatchSnapshot();
  });

  it('Should display text for ios', () => {
    Platform.select=jest.fn().mockImplementation((obj) => obj.ios);

    const testRenderer = renderer.create(
      <RNBlurredText
        style={styles.textStyle}
        value={testText}
        blurr={blurrVal}
      />
    );
    expect (testRenderer.toJSON()).toMatchSnapshot();
  });
});
