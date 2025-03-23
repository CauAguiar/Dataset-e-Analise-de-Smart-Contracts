# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `LERC20Burnable`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID          | Descrição                        | Severidade    |
|-------------|----------------------------------|---------------|
| F-2023-1434 | Floating Pragma ^0.8.0           | Low severity  |

---

### Análise por LLM

#### GPT-4o

| ID            | Descrição                                       | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)              |
|--------------|------------------------------------------------|----------------------|----------|------------------------------|
| F-2023-1434 | Floating Pragma ^0.8.0                         | -        | ❌       | FN                           |
| -            | Centralization Risk                           | High severity       | ❌       | FP                           |
| -            | Lossless Turn-Off Mechanism                   | High severity       | ❌       | FP                           |
| -            | Blacklisted Funds Transfer                    | High severity       | ❌       | FP                           |
| -            | Lack of Access Control in `acceptRecoveryAdminOwnership` | Medium severity | ❌       | FP                           |
| -            | Unchecked External Call in `lossless` Hooks   | Medium severity     | ❌       | FP                           |
| -            | Lack of Event Emission for Key Functions      | Low severity        | ❌       | FP                           |
| -            | Unchecked Arithmetic in `_approve` e `_burnFrom` | Low severity    | ❌       | FP                           |
| -            | Potential Lossless Dependency Risk            | Undetermined        | ❌       | FP                           |
| -            | Misleading Modifier Naming (`lssAprove`)      | Informational       | ❌       | FP                           |
| -            | Code Readability and Maintainability Issues   | Informational       | ❌       | FP                           |

**Matriz de Confusão:**  
|               | Vulnerável (Real) | Não Vulnerável (Real) |  
|---------------|------------------|----------------------|  
| **Detectado** | 0 (VP)           | 10 (FP)              |  
| **Não Detectado** | 1 (FN)       | 0 (VN)               |  

**Não Houve Erro de Classificação**

#### DeepSeek-R1  

| ID             | Descrição                                          | Severidade Detectada | Correta? | Tipo (VP/FP/FN)            |
|---------------|--------------------------------------------------|----------------------|----------|----------------------------|
| F-2023-1434  | Floating Pragma ^0.8.0                           | -        | ❌       | FN                         |
| -            | Reentrancy in Lossless Modifiers                 | High severity       | ❌       | FP                         |
| -            | Incorrect Balance Handling                      | High severity       | ❌       | FP                         |
| -            | Missing Zero-Address Checks                     | Medium severity     | ❌       | FP                         |
| -            | Front-Risk in Recovery Admin Ownership Acceptance | Medium severity     | ❌       | FP                         |
| -            | Unchecked Return Value for External Calls       | Low severity        | ❌       | FP                         |
| -            | Centralization Risks                            | Informational       | ❌       | FP                         |
| -            | Lack of Timelock for Admin Changes              | Informational       | ❌       | FP                         |
| -            | Dependency on External Lossless Controller      | Undetermined        | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|------------------|------------------------|
| **Detectado** | 0 (VP)           | 8 (FP)                 |
| **Não Detectado** | 1 (FN)       | 0 (VN)                 |

**Não Houve Erro de Classificação**

#### Llama 3.3

| ID              | Descrição                                      | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)          |
|----------------|------------------------------------------------|----------------------|----------|--------------------------|
| F-2023-1434    | Floating Pragma ^0.8.0                          | Informational         | ✅       | VP (severidade incorreta)                      |
| -              | Reentrancy                                      | High severity        | ❌       | FP                       |
| -              | Unprotected Function                            | High severity        | ❌       | FP                       |
| -              | Privilege Escalation                            | High severity        | ❌       | FP                       |
| -              | Use of Tx.origin                                | Medium severity      | ❌       | FP                       |
| -              | Unsecured Use of Transfer                      | Medium severity      | ❌       | FP                       |
| -              | Lack of Input Validation                       | Medium severity      | ❌       | FP                       |
| -              | Use of Unnecessary Variables                   | Low severity         | ❌       | FP                       |
| -              | Code Organization                              | Low severity         | ❌       | FP                       |
| -              | Lack of Comments                               | Low severity         | ❌       | FP                       |
| -              | Lossless Contract                              | Undetermined         | ❌       | FP                       |
| -              | Reentrancy in Lossless Contract                | Undetermined         | ❌       | FP                       |
| -              | Unused Imports                                 | Informational        | ❌       | FP                       |

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 12 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

**Erro de Classificação**

| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| F-2023-1434       | Informational              | Low                   | **1**    |  

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID            | Descrição                                                   | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)              |
|--------------|----------------------------------------------------------------|----------------------|----------|-----------------------------|
| F-2023-1434 | Floating Pragma ^0.8.0                                       | -        | ❌       | FN                          |
| -            | Falta de Validação do Contrato Lossless no Constructor     | Medium severity     | ❌       | FP                          |
| -            | Possível DoS em `transferOutBlacklistedFunds`             | Low severity        | ❌       | FP                          |
| -            | Risco de Reentrada em Funções Modificadas por Lossless      | Medium severity     | ❌       | FP                          |
| -            | Falta de Validação de `newAdmin` em `setLosslessAdmin`      | Low severity        | ❌       | FP                          |
| -            | Falta de Limite Superior para `timelockPeriod`               | Low severity        | ❌       | FP                          |
| -            | Manipulação Insegura de Allowance em `burnFrom`            | Informational - Low | ❌       | FP                          |
| -            | Variável `recoveryAdminKeyHash` como `string` em vez de `bytes32` | Informational       | ❌       | FP                          |
| -            | `acceptRecoveryAdminOwnership` pode ser reivindicada por qualquer endereço | Medium severity     | ❌       | FP                          |
| -            | Falta de Evento para `setLosslessAdmin`                     | Informational       | ❌       | FP                          |
| -            | Confusão semântica entre `admin` e `recoveryAdmin`         | Informational       | ❌       | FP                          |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

## Métricas Agregadas (LERC20Burnable.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 44.19 |
| **DeepSeek-R1** | 82.44 |
| **Llama 3.3** | 16.02 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 11.70 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 10 | 1 | 0 |
| **DeepSeek-R1** | 0 | 8 | 1 | 0 |
| **Llama 3.3** | 1 | 12 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 10 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 1 | 1 | 1.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

