---
layout: post
tags: [news, project]
image: /img/news/continual_learning.png
---

T-Brain의 두번째 연구 성과인 Continual Learning 관련 설명 글.

T-Brain의 새로운 연구 성과를 알려드립니다. 오늘 arXiv에 공개된 저희 논문의 제목은 “Continual Learning with Deep Generative Replay”로, 그동안 난제였던 continual learning에서의 망각 현상을 GAN을 이용하여 해결할 수 있는 가능성을 보였습니다.

Continual learning은 여러 task를 하나의 모델에 순차적으로 학습시켜, 최종적으로 모든 task의 수행이 가능한 모델을 학습시키는 것을 목표로 합니다. 하지만 새로운 task를 학습시킬 때, 모델이 새 task를 풀도록 완전히 바뀌어 이전 task를 모두 잊어버리는 “catastrophic forgetting” 현상이 발생합니다. 이를 해결하기 위해 최근 구글의 DeepMind에서도 Elastic Weight Consolidation(EWC)라는 신경망의 weight을 예전 task에 대한 중요도에 따라 유지시키는 기술을 제안하였습니다.

![img1](img/news/continual_learning1.png)

저희는 사람의 뇌에 존재하는 장기기억-단기기억의 상보적 학습 시스템에서 착안하여 GAN 기반의 generator와 주어진 task를 해결하는 solver의 두 모델로 구성된 Deep Generative Replay framework를 제안합니다. 이 두 모델만을 유지하면 이전 데이터를 저장하지 않고도 새로운 task를 푸는 동시에 이전 task를 잊어버리지 않을 수 있습니다. 

![img2](img/news/continual_learning2.png)

Generator와 solver로 구성된 이 모델은 학습뿐만 아니라 다른 모델에 학습된 지식을 전달하는 것도 가능하기 때문에 학자(scholar) 모델이라 불립니다. Generator는 이전 학자의 generator에서 생성된 fake data와 현재 task의 real data을 합친 분포를 재현하도록 학습되고, solver는 그에 대한 적절한 타겟을 예측하도록 학습됩니다.

![img3](img/news/continual_learning3.png)

예를 들어, 손글씨로 쓴 숫자를 인식하는 모델이 표지판의 숫자를 인식할 수 있도록 학습하는 과정에서 generative replay는 손으로 쓰여진 숫자를 잊어버리지 않도록 도움을 줄 수 있습니다. 기존 손글씨 인식 task에서 학습된 GAN에서 만들어진 가짜 input을 리플레이 시켜준 모델(GR: Generative Replay)은 실제 input을 넣어준 모델(ER: Exact Replay)에 뒤쳐지지 않는 정확도를 보였습니다. 현재 task의 데이터만을 넣어준 경우에는 기존 task에 대한 정확도가 크게 떨어지는 모습을 볼 수 있습니다(None). 동시에, 새로 학습되는 generator는 두 task의 인풋 모두를 재현할 수 있습니다.

![img4](img/news/continual_learning4.png)

더 다양한 응용 사례는 아래 주소에 있는 논문을 참고해 주세요!

논문 링크: [https://arxiv.org/abs/1705.08690](https://arxiv.org/abs/1705.08690)

