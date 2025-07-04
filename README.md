# 🤖 help_ai – AI 기반 스팸/스미싱 문자 차단 앱

**iOS용 온디바이스 AI 문자 필터링 앱 (SwiftUI + CoreML + SMS Filter Extension)**  
개인정보 유출로 인해 급증하는 **스팸·스미싱·보이스피싱 문자**를  
AI가 자동으로 분류하고 사용자에게 안전한 메시지 경험을 제공합니다.

---

## ✅ 주요 기능

- 📥 문자 메시지 실시간 필터링 (iOS SMS Filter Extension 기반)
- 🤖 스팸 / 스미싱 / 보이스피싱 / 광고성 문자 자동 분류
- ✍️ 사용자 정의 키워드/번호 필터 설정 (App 내 관리)
- 🔐 완전한 온디바이스 처리 (개인정보 유출 없음)
- 🧊 리퀴드 스타일 UI (SwiftUI + blur, gradient)

---

## 📦 프로젝트 구조
help_ai/
├── help_aiApp/                  # 메인 SwiftUI 앱
│   ├── Views/                   # UI 화면 구성 (대시보드, 설정 등)
│   ├── ViewModels/              # 상태 관리 및 필터 처리
│   ├── Models/                  # 메시지, 설정 모델 정의
│   └── Assets/                  # 배경색, 아이콘, 이미지 등
├── MessageFilterExtension/      # SMS 필터 Extension
│   └── MessageFilterExtension.swift
├── MLModel/                     # CoreML 모델 (스팸 분류기)
│   └── SpamClassifier.mlmodel
└── README.md

---

## 🛠 기술 스택

| 영역 | 사용 기술 |
|------|------------|
| 언어 | Swift 5.9 |
| UI | SwiftUI (iOS 17+) |
| 필터링 | IdentityLookup (SMS Filter Extension) |
| AI | CoreML (Naive Bayes or BERT 변환 모델) |
| 상태 관리 | ObservableObject, AppStorage |
| 데이터 공유 | App Group + UserDefaults |

---

## ⚙️ 설치 및 사용법

1. Xcode 15 이상 설치 후 이 레포지토리 Clone
2. `Signing & Capabilities` → App + Extension 모두 동일한 **App Group 설정**
3. 실기기에서 앱 실행
4. 설정 > 메시지 > 알 수 없는 발신자 및 스팸 > **help_ai 활성화**

---

## 📐 필터 동작 방식

- 메시지가 수신되면 iOS 시스템이 Extension에 전달
- Extension은 온디바이스 키워드 + ML 모델로 메시지 분류
- 결과에 따라 `.junk`, `.allow`, `.promotion` 등으로 처리
- 분류 결과는 메시지 앱 내에서 자동 분리됨

---

## 🔄 사용자 설정 항목

- ✅ 블랙리스트 키워드/번호
- ✅ 화이트리스트 예외 번호
- ✅ 민감도 설정 (향후 적용)
- ✅ 오탐/미탐 신고 (향후 수집용)

---

## 🔐 개인정보 보호

- 절대 외부 서버 전송 없음
- 모든 분석 및 저장은 기기 내에서만 수행
- 메시지 본문은 앱 외부로 노출되지 않음

---

## 👨‍💻 개발자

**임또이**  
---

## 📝 라이선스

MIT License
