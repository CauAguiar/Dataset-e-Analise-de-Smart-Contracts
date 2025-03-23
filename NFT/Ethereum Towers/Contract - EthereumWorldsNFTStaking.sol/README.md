# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `EthereumWorldsNFTStaking`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID           | Descrição                                | Severidade |
|-------------|------------------------------------------|------------|
| F-2022-1589 | Inconsistência no estado do contrato    | Alta       |
| F-2022-1590 | Lógica de aluguel não utilizada         | Média      |
| F-2022-1591 | Sombreamento de variável                | Baixa      |
| F-2022-1592 | Falta de eventos para rastreamento      | Baixa      |
| F-2022-1593 | Permissão de endereço zero              | Baixa      |
| F-2022-1594 | Uso redundante da biblioteca SafeCast   | Baixa      |

---

#### GPT-4o
| ID            | Descrição                                      | Severidade Detectada       | Correta? | Tipo (VP/FP/FN) |
|--------------|------------------------------------------------|----------------------------|----------|--------------------------|
| F-2022-1589  | Inconsistência no estado do contrato           | -                          | ❌       | FN                       |
| F-2022-1590  | Lógica de aluguel não utilizada               | -                          | ❌       | FN                       |
| F-2022-1591  | Sombreamento de variável                      | -                          | ❌       | FN                       |
| F-2022-1592  | Falta de eventos para rastreamento            | Medium severity            | ✅       | VP (severidade incorreta) |
| F-2022-1593  | Permissão de endereço zero                    | -                          | ❌       | FN                       |
| F-2022-1594  | Uso redundante da biblioteca SafeCast         | Medium severity            | ✅       | VP (severidade incorreta) |
| -            | Reentrancy Attack Risk                        | Low severity               | ❌       | FP                       |
| -            | Signature Replay Attack                       | High severity              | ❌       | FP                       |
| -            | Centralized Control via `onlyOwner`           | High severity              | ❌       | FP                       |
| -            | Lack of Emergency Withdraw Mechanism          | High severity              | ❌       | FP                       |
| -            | Lack of Input Validation                      | Medium severity            | ❌       | FP                             |
| -            | Gas Inefficiencies                            | Low severity               | ❌       | FP                       |
| -            | Storage Slot Inefficiency                     | Low severity               | ❌       | FP                       |
| -            | Lack of Documentation                         | Informational              | ❌       | FP                       |
| -            | Redundant Code                                | Informational              | ❌       | FP                       |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 9 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

#### Erro de Classificação:
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|------------------------|-------------------------|  
| F-2022-1594          | Medium                 | Low | **1**    |  
| F-2022-1592            | Medium                 | Low | **1**    |  

---

### DeepSeek-R1

| ID            | Descrição                                      | Severidade Detectada       | Correta? | Tipo (VP/FP/FN) |
|--------------|------------------------------------------------|----------------------------|----------|--------------------------|
| F-2022-1589  | Inconsistência no estado do contrato           | -                          | ❌       | FN                       |
| F-2022-1590  | Lógica de aluguel não utilizada               | Medium severity            | ✅       | VP  |
| F-2022-1591  | Sombreamento de variável                      | -                          | ❌       | FN                       |
| F-2022-1592  | Falta de eventos para rastreamento            | -                          | ❌       | FN                       |
| F-2022-1593  | Permissão de endereço zero                    | -                          | ❌       | FN                       |
| F-2022-1594  | Uso redundante da biblioteca SafeCast         | Low severity               | ✅       | VP                       |
| -            | Incorrect Token Count Adjustment in Emergency Unstake | High severity     | ❌       | FP                       |
| -            | Invalid ERC721 Receiver Implementation        | High severity              | ❌       | FP                       |
| -            | Reward Token Drain via Rescue Function        | High severity              | ❌       | FP                       |
| -            | Signature Replay Risk Across Functions        | High severity              | ❌       | FP                       |
| -            | Missing Parameter Validation in `setRentable` | Medium severity            | ❌       | FP                       |
| -            | Nonce Mismanagement                           | Medium severity            | ❌       | FP                       |
| -            | Unrestricted `maxTokensInStake` Updates      | Low severity               | ❌       | FP                       |
| -            | Reward Calculation Dependency                 | Undetermined risk          | ❌       | FP                       |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 8 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

---

### Llhama 3.3

| ID           | Descrição                                           | Severidade Detectada   | Correta? | Tipo (VP/FP/FN)                 |
|-------------|-----------------------------------------------------|------------------------|----------|---------------------------------|
| F-2022-1589 | Inconsistência no estado do contrato               | -                      | ❌       | FN                              |
| F-2022-1590 | Lógica de aluguel não utilizada                    | -                      | ❌       | FN                              |
| F-2022-1591 | Sombreamento de variável                           | -                      | ❌       | FN                              |
| F-2022-1592 | Falta de eventos para rastreamento                 | -                      | ❌       | FN                              |
| F-2022-1593 | Permissão de endereço zero                         | -                      | ❌       | FN                              |
| F-2022-1594 | Uso redundante da biblioteca SafeCast              | -                      | ❌       | FN                              |
| -           | Reentrância                                        | Low                    | ❌       | FN        |
| -           | Uso de `tx.origin`                                 | High                   | ❌       | FP                              |
| -           | Permissões excessivas                              | High                   | ❌       | FP                              |
| -           | Falta de validação de entrada                      | Medium                 | ❌       | FP                              |
| -           | Uso de `block.timestamp`                           | Medium                 | ❌       | FP                              |
| -           | Falta de documentação                              | Medium                 | ❌       | FP                              |
| -           | Uso de `uint256` para índices                      | Low                    | ❌       | FP                              |
| -           | Falta de otimização                                | Low                    | ❌       | FP                              |
| -           | Uso de `ECDSA`                                     | Undetermined           | ❌       | FP                              |
| -           | Uso de `keccak256`                                 | Undetermined           | ❌       | FP                              |
| -           | Uso de `pragma solidity 0.8.9`                     | Informational          | ❌       | FP                              |
| -           | Uso de `UNLICENSED`                                | Informational          | ❌       | FP                              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 12 (FP)                 |
| **Não Detectado** | 6 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID           | Descrição                                                      | Severidade Detectada         | Correta? | Tipo (VP/FP/FN)                 |
|-------------|----------------------------------------------------------------|------------------------------|----------|---------------------------------|
| F-2022-1589 | Inconsistência no estado do contrato                           | -                            | ❌       | FN                              |
| F-2022-1590 | Lógica de aluguel não utilizada                               | -                            | ❌       | FN                              |
| F-2022-1591 | Sombreamento de variável                                      | -                            | ❌       | FN                              |
| F-2022-1592 | Falta de eventos para rastreamento                            | -               |❌   | FN       |
| F-2022-1593 | Permissão de endereço zero                                    | -                            | ❌       | FN                              |
| F-2022-1594 | Uso redundante da biblioteca SafeCast                         | Informational                | ❌             | FN
| -           | Dependência crítica do signatário de serviço único            | High                         | ❌       | FP                              |
| -           | Possível negação de serviço em `emergencyUnstake`             | Medium                       | ❌       | FP                              |
| -           | Risco de out-of-gas em `emergencyUnstake`                     | Medium                       | ❌       | FP                              |
| -           | Limitação da função `onERC721Received`                        | Low                          | ❌       | FP                              |
| -           | Uso ambíguo de `abi.encodePacked` em assinaturas EIP712       | Informational                | ❌       | FP                              |
| -           | Tipo de `rentalDailyPrice` poderia ser `uint256`              | Informational                | ❌       | FP                              |
| -           | Falta de eventos para ações administrativas                   | Informational                | ❌       | FP       |


**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 6 (FN)         | 0 (VN)                 |

---



## Métricas Agregadas (EthereumWorldsNFTStaking.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 28.60 |
| **DeepSeek-R1** | 92.35 |
| **Llama 3.3** | 9.92 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 21.10 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 2 | 9 | 4 | 0 |
| **DeepSeek-R1** | 2 | 8 | 4 | 0 |
| **Llama 3.3** | 0 | 12 | 6 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 7 | 6 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 2 | 2 | 1.00 |
| **DeepSeek-R1** | 0 | 2 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

