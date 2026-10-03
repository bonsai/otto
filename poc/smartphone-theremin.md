# Smartphone Theremin POC

元Issue: https://github.com/bonsai/kana/issues/1

## 目的

スマホブラウザの傾きセンサーを、テルミン型の音源コントローラーとして使うPOC。

## 構成

DeviceOrientation
→ Sensor Adapter
→ Event Bus

Event Bus:
- Tone.js → テルミン音
- p5.js → センサー状態の可視化
- MIDI → 外部シンセ
- WS → PC / 別ブラウザ

## センサー

- gamma（左右の傾き）→ pitch
- beta（前後の傾き）→ volume
- alpha / 端末回転 → 必要に応じて vibrato

## 要件

- スマホブラウザで動作
- DeviceOrientation APIをfeature detect
- iOS等の権限要求に対応
- センサー値をEvent Busへ正規化
- Tone.jsで連続音を生成
- p5.jsでpitch / volume / orientationを可視化
- WS Adapterとは直接結合しない
- JavaScriptで実装（TypeScript不要）
- センサー未対応でもアプリ全体を停止させない

## Event

{
  type: "sensor",
  sensor: "orientation",
  beta: 12.4,
  gamma: -31.2,
  alpha: 85.1,
  time: 1234
}

## 発展

- WS経由でPC側Tone.js / WebPdを演奏
- MIDI CCへのマッピング
- OSC bridge
- キャリブレーション
- ジャイロによるビブラート
- センサー値の記録・再生

## 責務

POC実装・デプロイ実験は `otto` 側で扱う。
`kana` は音楽エージェント本体・Event Bus・Skill側の実装を担当する。