# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `TGKMainContract`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID      | Descrição                                                               | Severidade         |
|---------|-------------------------------------------------------------------------|--------------------|
| TENGO-2 | The Contract TGKMainContract Is Not Able to Receive NFTs via Safe Transfers | High severity      |
| TENGO-4 | Missing Test Suite and Limited Documentation Makes It Hard to Assess that the System Works as Expected | High severity      |
| TENGO-5 | Privileged Roles and Ownership                                          | Low severity       |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                        | Low severity       |
| TENGO-7 | Missing Input Validation                                                | Low severity       |
| TENGO-8 | Using transfer() for ETH May Fail in The Future                         | Informational      |

---

### Análise por LLM

#### GPT-4o
 | ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|----------------|
| TENGO-2 | The Contract TGKMainContract Is Not Able to Receive NFTs via Safe Transfers | -      | ❌ | FN 
| TENGO-4 | Missing Test Suite and Limited Documentation Makes It Hard to Assess that the System Works as Expected | -       |  ❌ | FN
| TENGO-5 | Privileged Roles and Ownership                                          | Undertemined          | ✅       | VP (severidade incorreta) |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                        | -       | ❌ | FN
| TENGO-7 | Missing Input Validation                                          | Medium severity             | ✅       | VP (severidade incorreta) |
| TENGO-8 | Using transfer() for ETH May Fail in The Future                         | Low severity          | ✅       | VP (severidade incorreta) |
| -       | Centralization Risk                                                    | High severity            | ❌       | FP |
| -       | Missing Reentrancy Guard in `withdraw`                                                    | High severity            | ❌       | FP |
| -       | Lack of Ownership Transfer Mechanism                                                    | High severity            | ❌       | FP |
| -       | Missing Event for Ownership Change                                      | Medium severity          | ❌       | FP |
| -       | Hardcoded Owner in Constructor                                         | Low severity             | ❌       | FP |
| -       | No Emergency Pause Mechanism                                                  | Informational            | ❌       | FP |
| -       | Lack of Detailed Error Messages                                                   | Informational            | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 3 (VP)             | 7 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| TENGO-5               | Undetermined             | Low                 | **2**    |  
| TENGO-7               | Medium             | Low                 | **1**    | 
| TENGO-8               | Low              | Informational                | **1**    | 

#### DeeoSeek-R1

 | ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|----------------|
| TENGO-2 | The Contract TGKMainContract Is Not Able to Receive NFTs via Safe Transfers | -      | ❌ | FN 
| TENGO-4 | Missing Test Suite and Limited Documentation Makes It Hard to Assess that the System Works as Expected | -       |  ❌ | FN
| TENGO-5 | Privileged Roles and Ownership                                       | Medium severity          | ✅       | VP (severidade incorreta) |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                        | -       | ❌ | FN
| TENGO-7 | Missing Input Validation                                          | -           | ❌       | FN |
| TENGO-8 | Using transfer() for ETH May Fail in The Future                      | Medium severity          | ✅       | VP (severidade incorreta) |
| -       | Centralization Risk                                                    | High severity            | ❌       | FP |
| -       | Redundant NFT Ownership Check                                         | Low severity             | ❌       | FP |
| -       | Immutable Ownership                                                  | Informational            | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 3 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| TENGO-5               | Medium             | Low                 | **1**    | 
| TENGO-8               | Medium              | Informational                | **2**    | 

#### Llama 3.3
 | ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|----------------|
| TENGO-2 | The Contract TGKMainContract Is Not Able to Receive NFTs via Safe Transfers | Undetermined      | ✅ | VP (severidade incorreta)
| TENGO-4 | Missing Test Suite and Limited Documentation Makes It Hard to Assess that the System Works as Expected | Low severity       |  ✅ | VP (severidade incorreta)
| TENGO-5 | Privileged Roles and Ownership                                          | -         | ❌        | FN |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                        | -       | ❌ | FN
| TENGO-7 | Missing Input Validation                                          | Medium severity             | ✅       | VP (severidade incorreta) |
| TENGO-8 | Using transfer() for ETH May Fail in The Future                   | Medium severity          | ✅       | VP (severidade incorreta) |
| -       | Reentrância                                                 | High severity            | ❌       | FP |
| -       | Falta de timeout                                      | Medium severity          | ❌       | FP |
| -       | Falta de validação de endereços                                     | Medium severity          | ❌       | FP |
| -       | Uso de `require()`                                        | Low severity             | ❌       | FP |
| -       | Uso de variáveis públicas                                         | Low severity             | ❌       | FP |
| -       | Versão do Solidity                                                  | Informational            | ❌       | FP |
| -       | Uso de bibliotecas                                                  | Informational            | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 4 (VP)             | 7 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| TENGO-2               | Undetermined              | High                 | **4**    | 
| TENGO-4               | Low              | High                | **2**    | 
| TENGO-7               | Medium             | Low                 | **1**    | 
| TENGO-8               | Medium              | Informational                | **2**    | 

#### Gemini 2.0 Flash Thinking Experimental 01-21
 | ID      | Descrição                                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|---------|-------------------------------------------------------------------------|--------------------------|----------|----------------|
| TENGO-2 | The Contract TGKMainContract Is Not Able to Receive NFTs via Safe Transfers | Low severity      | ✅ | VP (severidade incorreta)
| TENGO-4 | Missing Test Suite and Limited Documentation Makes It Hard to Assess that the System Works as Expected | -     |  ❌ | FN
| TENGO-5 | Privileged Roles and Ownership                                          | Low severity       | ✅        | VP |
| TENGO-6 | Potential Use of Compiler Version with Known Bugs                        | -       | ❌ | FN
| TENGO-7  | Missing Input Validation                                      | Medium severity             | ✅       | VP (severidade incorreta) |
| TENGO-8 | Using transfer() for ETH May Fail in The Future                   | -         | ❌       | FN |
| -       | Risco de Reentrância em `withdraw`                                         | Low severity             | ❌       | FP |
| -       | Risco de DoS em `withdraw`                                    | Medium severity          | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 3 (VP)             | 2(FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| TENGO-2               | Low             | High                 | **2**    | 
| TENGO-7               | Medium              | Low              | **1**    | 



## Métricas Agregadas (TGKMainContract.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 5.58 |
| **DeepSeek-R1** | 11.21 |
| **Llama 3.3** | 15.50 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 14.89 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 3 | 7 | 3 | 0 |
| **DeepSeek-R1** | 2 | 3 | 4 | 0 |
| **Llama 3.3** | 4 | 7 | 2 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 3 | 2 | 3 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 4 | 3 | 1.33 |
| **DeepSeek-R1** | 3 | 2 | 1.50 |
| **Llama 3.3** | 9 | 4 | 2.25 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 3 | 3 | 1.00 |

