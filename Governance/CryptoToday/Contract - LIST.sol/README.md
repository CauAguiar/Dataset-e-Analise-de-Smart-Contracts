# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `LIST`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
| V01      | Redundant import. “@openzeppelin/contracts/token/ERC20/ERC20.sol" import is redundant. | Low severity  |

---

#### GPT-4o
  
| ID  | Descrição                                              | Severidade Detectada | Correta? | Tipo (VP/FP/FN)             |
|-----|------------------------------------------------------|----------------------|----------|-----------------------------|
| V01 | Redundant import. "@openzeppelin/contracts/token/ERC20/ERC20.sol" import is redundant. | - | ❌ | FN |
| -   | Reentrancy Attack (Invest Function)                 | High severity       | ❌       | FP |
| -   | Unrestricted Ether Withdrawal (endSale Function)    | High severity       | ❌       | FP |
| -   | Improper Token Minting Control (claimShares & claimFutures Functions) | High severity       | ❌       | FP |
| -   | Lack of Input Validation (Invest Function)          | Medium severity     | ❌       | FP |
| -   | Lack of Sale End Enforcement (Invest Function)      | Medium severity     | ❌       | FP |
| -   | Use of Block Timestamp for Time-Based Logic        | Medium severity     | ❌       | FP |
| -   | Gas Inefficiency in Investor Management            | Low severity        | ❌       | FP |
| -   | Use of `transfer()` Instead of `call()`            | Low severity        | ❌       | FP |
| -   | Missing Events for Critical Functions              | Informational       | ❌       | FP |
| -   | Unused `_pause()` in Constructor                   | Informational       | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
___________________________________________________________________________________________________________________________________________________________________
#### DeepSeek-R1

| ID  | Descrição                                      | Severidade Detectada | Correta? | Tipo (VP/FP/FN)                        |
|-----|----------------------------------------------|----------------------|----------|--------------------------------|
| V01 | Redundant import. "@openzeppelin/contracts/token/ERC20/ERC20.sol" import is redundant. | - | ❌    | FN        |
| -   | Division by Zero in endSale                 | High severity        | ❌       | FP                             |
| -   | Unbounded Loop in endSale                   | High severity        | ❌       | FP                             |
| -   | Centralization Risks                        | Medium severity      | ❌       | FP                             |
| -   | Integer Division Precision Loss            | Medium severity      | ❌       | FP                             |
| -   | Referral System Front-Running              | Medium severity      | ❌       | FP                             |
| -   | Zero Value Investments Allowed             | Low severity         | ❌       | FP                             |
| -   | Minting Zero Tokens                        | Low severity         | ❌       | FP                             |
| -   | Use of block.timestamp                     | Informational        | ❌       | FP                             |
| -   | Dependency on LISTFuture Implementation    | Undetermined         | ❌       | FP                             |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
___________________________________________________________________________________________________________________________________________________________________

#### Llama 3.3 

| ID  | Descrição                          | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|-----|------------------------------------|--------------------------|----------|------------------|
| V01 | Redundant import. “@openzeppelin/contracts/token/ERC20/ERC20.sol" import is redundant. | - | ❌  | FN |
| -   | Reentrancy                         | High severity            | ❌ | FP |
| -   | Unprotected Function              | High severity            | ❌ | FP |
| -   | Use of Transfer                   | High severity            | ❌ | FP |
| -   | Timestamp Dependence              | Medium severity          | ❌ | FP |
| -   | Reentrancy in `claimFutures`      | Medium severity          | ❌ | FP |
| -   | Unvalidated User Input            | Medium severity          | ❌ | FP |
| -   | Use of Deprecated Functions       | Low severity            | ❌ | FP |
| -   | Missing Event Emission            | Low severity            | ❌ | FP |
| -   | Inconsistent Naming               | Low severity            | ❌ | FP |
| -   | Fairness of the Token Distribution| Undetermined             | ❌ | FP |
| -   | Security of the Off-Chain System  | Undetermined             | ❌ | FP |
| -   | Code Organization                 | Informational            | ❌ | FP |
| -   | Use of Secure Libraries           | Informational            | ❌ | FP |
| -   | Clear Documentation               | Informational            | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação

#### Gemini 2.0 Flash Thinking Experimental 01-21  

| ID   | Descrição                                                   | Severidade Detectada | Correta? | Tipo (VP/FP/FN)               |
|------|------------------------------------------------------------|----------------------|----------|--------------------------------|
| V01  | Redundant import. "@openzeppelin/contracts/token/ERC20/ERC20.sol" import is redundant. | - | ❌ | FN |
| -    | Reentrância na Transferência de Referência                 | Medium severity     | ❌       | FP |
| -    | Potencial DoS em endSale devido à Iteração do Array de Investidores | Low severity | ❌ | FP |
| -    | Falta de Validação de Entrada para Valor de Investimento   | Informational       | ❌       | FP |
| -    | Controle Centralizado via Proprietário (Owner)             | Informational       | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
___________________________________________________________________________________________________________________________________________________________________


## Métricas Agregadas (LIST.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 33.08 |
| **DeepSeek-R1** | 118.42 |
| **Llama 3.3** | 7.26 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 9.11 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 10 | 1 | 0 |
| **DeepSeek-R1** | 0 | 9 | 1 | 0 |
| **Llama 3.3** | 0 | 6 | 1 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

