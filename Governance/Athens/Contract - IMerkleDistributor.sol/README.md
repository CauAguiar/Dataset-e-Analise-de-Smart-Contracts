# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `IMerkleDistributor`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                                      | Severidade           |
|-----|----------------------------------------------------------------|----------------------|
| V01 | Ownership pode ser renunciado                                  | Low                 |
| V02 | Diferentes versões do Solidity utilizadas                      | Informational       |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8 em operações | Informational       |

#### GPT-4o

| ID  | Descrição                                                      | Severidade Detectada         | Correta? | Tipo (VP/FP/FN)                    |
|-----|----------------------------------------------------------------|------------------------------|----------|------------------------------------|
| V01 | Ownership pode ser renunciado                                  | -                            | ❌       | FN                                 |
| V02 | Diferentes versões do Solidity utilizadas                      | -                            | ❌       | FN                                 |
| V03 | Otimização de Gas: novo tipo do Solidity 0.8 em operações      | -                            | ❌       | FN                                 |
|  -  | Lack of Implementation                                         | High severity                | ❌       | FP                                 |
|  -  | No Access Control on `claim` Function                          | Medium severity              | ❌       | FP                                 |
|  -  | Merkle Root Manipulation                                       | Medium severity              | ❌       | FP                                 |
|  -  | No Protection Against Front-Running                            | Low severity                 | ❌       | FP                                 |
|  -  | Lack of Event Emission for Critical Functions                  | Informational                | ❌       | FP                                 |
|  -  | No Explicit Return Values for Functions                        | Informational                | ❌       | FP                                 |
|  -  | Reentrancy Risk (Dependent on Implementation)                 | Undetermined severity        | ❌       | FP                                 |
|  -  | Gas Limit Considerations for Large Merkle Proofs              | Undetermined severity        | ❌       | FP                                 |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 8 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

#### DeepSeek-R1

| ID  | Descrição                                                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                 |
|-----|----------------------------------------------------------|---------------------------|----------|----------------------------------|
| V01 | Ownership pode ser renunciado                            | -                         | ❌       | FN                               |
| V02 | Diferentes versões do Solidity utilizadas                | -                         | ❌       | FN                               |
| V03 | Otimização de Gas: novo tipo do Solidity 0.8             | -                         | ❌       | FN                               |
|  -  | Improper Access Control in `claim` Function              | High severity             | ❌       | FP                               |
|  -  | Reentrância na função `claim`                            | High severity             | ❌       | FP    |
|  -  | Merkle Proof Validation Flaws                            | Undetermined severity     | ❌       | FP                               |
|  -  | Mutable Merkle Root                                      | Undetermined severity     | ❌       | FP                               |
|  -  | Event Emission Consistency                               | Informational             | ❌       | FP                               |
|  -  | Input Validation Gaps                                    | Informational             | ❌       | FP                               |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

#### Llama 3.3

| ID  | Descrição                                                                  | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|----------------------------------------------------------------------------|----------------------|----------|-----------------|
| V01 | Ownership pode ser renunciado                                              | -                    | ❌       | FN              |
| V02 | Diferentes versões do Solidity utilizadas                                  | -                    | ❌       | FN              |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8 em operações      | -                    | ❌       | FN              |
|  -  | Falta de validação de entrada                                              | High                 | ❌       | FP              |
|  -  | Manipulação de dados da árvore de Merkel                                   | High                 | ❌       | FP              |
|  -  | Vulnerabilidade de reentrada                                               | High                 | ❌       | FP              |
|  -  | Problemas de visibilidade                                                  | Medium               | ❌       | FP              |
|  -  | Dos (Denial of Service)                                                    | Medium               | ❌       | FP              |
|  -  | Uso de funções obsoletas                                                   | Medium               | ❌       | FP              |
|  -  | Ineficiência gas                                                           | Low                  | ❌       | FP              |
|  -  | Problemas de formatação ou estilização do código                           | Low                  | ❌       | FP              |
|  -  | Ausência de implementação completa                                         | Undetermined         | ❌       | FP              |
|  -  | Dependência externa                                                        | Undetermined         | ❌       | FP              |
|  -  | Informações de licenciamento                                               | Informational        | ❌       | FP              |
|  -  | Suporte asolidity específico                                               | Informational        | ❌       | FP              |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 12 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                                                  | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |
|-----|----------------------------------------------------------------------------|----------------------|----------|-----------------|
| V01 | Ownership pode ser renunciado                                              | -                    | ❌       | FN              |
| V02 | Diferentes versões do Solidity utilizadas                                  | -                    | ❌       | FN              |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8 em operações      | -                    | ❌       | FN              |
|  -  | Endereço de Token Incorreto                                                  | Informational        | ❌       | FP              |
|  -  | Merkle Root Incorreto                                                        | Medium               | ❌       | FP              |
|  -  | Status `isClaimed` Incorreto                                                 | Medium               | ❌       | FP              |
|  -  | Falta de Validação de Inputs na Função `claim` (Implementação)               | High                 | ❌       | FP              |
|  -  | Reentrância na Função `claim` (Implementação)                                | Medium/High          | ❌       | FP              |
|  -  | Negação de Serviço via Prova Merkle Complexa (Implementação)                 | Low/Medium           | ❌       | FP              |
|  -  | Ataque de Front-running na Função `claim` (Implementação)                    | Informational/Low    | ❌       | FP              |
|  -  | Emissão de Evento `Claimed` Incorreta ou Ausente (Implementação)             | Informational        | ❌       | FP              |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 8 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |







## Métricas Agregadas (IMerkleDistributor.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 10.63 |
| **DeepSeek-R1** | 104.55 |
| **Llama 3.3** | 19.27 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 11.26 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 8 | 3 | 0 |
| **DeepSeek-R1** | 0 | 6 | 3 | 0 |
| **Llama 3.3** | 0 | 12 | 3 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 8 | 3 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

