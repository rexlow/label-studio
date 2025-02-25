---
title: Speaker Segmentation
type: templates
category: Audio/Speech Processing
cat: audio-speech-processing
order: 303
meta_title: Speaker Segmentation Data Labeling Template
meta_description: Template for segmenting an audio clip based on speaker with Label Studio for your machine learning and data science projects.
---

<img src="/images/templates/speaker-segmentation.png" alt="" class="gif-border" width="552px" height="408px" />

When preparing audio transcripts or training a machine learning model to differentiate between different speakers, use this template to perform speaker segmentation and label different regions of an audio clip with different speakers. 

## Template Preview

Interactively preview this labeling template:

<div id="main-preview"></div>

## Labeling Configuration

```html
<View>
    <!--Use the Labels control tag to allow annotators to highlight specific
    regions of the audio clip, zoom, and use a hotkey to apply labels.-->
  <Labels name="label" toName="audio" zoom="true" hotkey="ctrl+enter">
    <Label value="Speaker one" background="#00FF00"/>
    <Label value="Speaker two" background="#12ad59"/>
  </Labels>
    <!--Use the AudioPlus object tag to display a waveform of audio-->
  <AudioPlus name="audio" value="$audio" />
</View>
```

## Related tags

- [Labels](/tags/labels.html)
- [AudioPlus](/tags/audioplus.html)

