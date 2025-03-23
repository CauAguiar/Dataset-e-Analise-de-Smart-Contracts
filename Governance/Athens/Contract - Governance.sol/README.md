# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Governance`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                                      | Severidade           |
|-----|----------------------------------------------------------------|----------------------|
| V01 | Ownership pode ser renunciado                                  | Low                 |
| V02 | Diferentes versões do Solidity utilizadas                      | Informational       |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8 em operações | Informational       |

#### GPT-4o

| ID  | Descrição                                                      | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                  |
|------|----------------------------------------------------------------|---------------------------|----------|----------------------------------|
| V01 | Ownership pode ser renunciado                                   | -                         | ❌       | FN                               |
| V02 | Diferentes versões do Solidity utilizadas                       | -                         | ❌       | FN                               |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8    | -                         | ❌       | FN                               |
| -   | Integer Underflow in `unlockedBalanceOf`                        | High severity             | ❌       | FP                               |
| -   | Reentrancy Risk in `lock` and `unlock`                          | High severity             | ❌       | FP                               |
| -   | Batch Transfer Gas Limit Issue (`transfers` function)           | High severity             | ❌       | FP                               |
| -   | Lack of Access Control on `lock` and `unlock`                   | Medium severity           | ❌       | FP                               |
| -   | Upgradeability Risk (`__gap` not properly reserved)             | Medium severity           | ❌       | FP                               |
| -   | Lack of Event Emission for Critical Actions                     | Low severity              | ❌       | FP                               |
| -   | Unnecessary `return true` in Functions                          | Low severity              | ❌       | FP                               |
| -   | Redundant Comments in `initialize` Function                     | Informational             | ❌       | FP                               |
| -   | Use of `public` Visibility in `initialize`                      | Informational             | ❌       | FP            
|
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

#### DeepSeek-R1

| ID  | Descrição                                                       | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                  |
|------|------------------------------------------------------------------|---------------------------|----------|----------------------------------|
| V01 | Ownership pode ser renunciado                                    | High severity             | ✅       | VP (severidade incorreta)        |
| V02 | Diferentes versões do Solidity utilizadas                        | -                         | ❌       | FN                               |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8     | -                         | ❌       | FN                               |
| -   | Potential Underflow in `unlockedBalanceOf`                       | Low severity              | ❌       | FP                               |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 1 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V01                | High              | Low                | **2**    |  

---
### Llama 3.3

| ID  | Descrição                                        | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)            |
|------|--------------------------------------------------|---------------------------|----------|----------------------------|
| V01  | Ownership pode ser renunciado                    | -          | ❌       | FN                         |
| V02  | Diferentes versões do Solidity utilizadas        | -           | ❌       | FN                         |
| V03  | Otimização de Gas: usar o novo tipo de dado      | Low severity | ✅       | VP                         |
| -    | Reentrância                                      | High severity             | ❌       | FP                         |
| -    | Front-running                                    | High severity             | ❌       | FP                         |
| -    | Reuso de Não-resposta (problemas de init)        | Medium severity           | ❌       | FP                         |
| -    | Lixeiras em Mappings                             | Medium severity           | ❌       | FP                         |
| -    | Alertas de Compiler                              | Low severity              | ❌       | FP                         |
| -    | Ataques de Economia                              | Undetermined              | ❌       | FP                         |
| -    | Segurança de imports                             | Informational             | ❌       | FP                         |
| -    | Documentação                                     | Informational             | ❌       | FP                         |
| -    | Testes                                           | Informational             | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 9 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V01                | Low              | Informational                | **1**    |  

---

### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                                      | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                  |
|------|----------------------------------------------------------------|---------------------------|----------|----------------------------------|
| V01 | Ownership pode ser renunciado                                   | -                         | ❌       | FN                               |
| V02 | Diferentes versões do Solidity utilizadas                       | -                         | ❌       | FN                               |
| V03 | Otimização de Gas: usar o novo tipo de dado do Solidity 0.8    | -                         | ❌       | FN                               |
| -   | Potencial DoS por Limite de Gas em `transfers`                 | Medium severity           | ❌       | FP                               |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | O (VP)             | 1 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |



## Métricas Agregadas (Governance.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 16.53 |
| **DeepSeek-R1** | 92.93 |
| **Llama 3.3** | 13.76 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 6.04 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 9 | 3 | 0 |
| **DeepSeek-R1** | 1 | 1 | 2 | 0 |
| **Llama 3.3** | 1 | 9 | 2 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 1 | 3 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 2 | 1 | 2.00 |
| **Llama 3.3** | 1 | 1 | 1.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

