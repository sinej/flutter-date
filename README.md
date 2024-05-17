# 프로젝트 목표

- DateTime 실전
- MediaQuery 사용해보기
- DatePicker 사용해보기
- 여러개의 위젯으로 코드 정리하기
- 폰트 적용해보기
- 테마 사용해보기

SizeBox
MediaQuery vs Double.infinity
너비만큼 mediaQuery에서 width값으로 나눌 수 있다.
```
// MediaQuery
body: SizeBox(
    width: MediaQuery.of(context).size.width,
    // width: MediaQuery.of(context).size.width, / 2 반 만큼
    // width: MediaQuery.of(context).size.width, / 3 1/3 만큼
)

// Double.infinity
body: SizeBox(
    width: Doublue.infinity,
)
```


dev.2024.05.17