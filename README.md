# ole

하스켈로 OLE 파일 포맷을 분석하는 라이브러리 개발을 시작했습니다.

현재 헤더 블록까지 구현됐습니다.

프로그램을 실행하면 아래와 같이 헤더 블록의 정보를 출력합니다.

```
% cabal run
HeaderBlock {magicID = "\208\207\DC1\224\161\177\SUB\225", numberOfBBATdepot = 20, startBlockOfProperty = 2, startBlockOfSBAT = 1371, numberOfSBATdepot = 2, arrayOfBBATdepotMembers = [3,1364,755,1365,1366,7,6,898,1026,1154,5,1367,1368,1369,1370,8,1101,783,786,22]}
```

## 참고 자료

아래 최원혁님의 글을 보면 OLE 구조를 파악하는데 도움이 됩니다.

* [OLE 파일 포맷 (1) - 개요 및 기본 구조 - Kei Choi](http://www.hanul93.com/ole-fileformat-basic/)
* [OLE 파일 포맷 (2) - 헤더 블록 - Kei Choi](http://www.hanul93.com/ole-fileformat-bbat/)
* [OLE 파일 포맷 (3) - Block Allocation Table(BBAT)와 BBAT Depot](http://www.hanul93.com/ole-fileformat-header/)
* [OLE 파일 포맷 (4) - 프로퍼티(Property)와 프로퍼티 스토리지(Storage)](http://www.hanul93.com/ole-fileformat-property/)
* [OLE 파일 포맷 (5) - Small Block Allocation Table(SBAT)와 SBAT Depot](http://www.hanul93.com/ole-fileformat-sbat/)
