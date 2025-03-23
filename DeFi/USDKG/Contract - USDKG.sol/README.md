# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `USDKG`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                                  | Severidade          |
|-----|------------------------------------------------------------|---------------------|
| V01 | transferFrom() Lacks notBlackListed Modifier on the Spender | Medium severity     |
| V02 | Missing Validation for Parameters in the Constructor       | Medium severity     |
| V03 | Small Amount Can Ignore Fee on Transfer                    | Minor severity      |
| V04 | Fee Basis Points Can’t Reach the Maximum Unlike What Is Described in the Documentation | Minor severity      |
| V05 | Inaccurate Comments and Messages                           | Minor severity      |
| V06 | Settle Solidity Version                                    | Minor severity      |

---

### Análise por LLM

#### GPT-4o

| ID   | Descrição                                                    | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)             |
|------|--------------------------------------------------------------|--------------------------|----------|----------------------------|
| V01  | transferFrom() Lacks notBlackListed Modifier on the Spender   | -             | ❌       | FN                         |
| V02  | Missing Validation for Parameters in the Constructor         | Low severity          | ✅       | VP (Severidade incorreta) |
| V03  | Small Amount Can Ignore Fee on Transfer                      | -           | ❌        | FN                          |
| V04  | Fee Basis Points Can’t Reach the Maximum Unlike What Is Described in the Documentation | -        | ❌        | FN        |
| V05  | Inaccurate Comments and Messages                             | -           | ❌        | FN                          |
| V06  | Settle Solidity Version                                      | -           | ❌        | FN                   |
| -    | Integer Underflow & Overflow in Transfers                    | High severity            | ❌       | FP                         |
| -    | Missing Event Emission in `approve`                          | High severity            | ❌       | FP                         |
| -    | Lack of Front-Running Protection for `approve`                | High severity            | ❌       | FP                         |
| -    | Blacklisted Users Can Still Receive Funds                    | High severity            | ❌       | FP                         |
| -    | Unchecked External Calls in ERC20 Interface                  | High severity            | ❌       | FP                         |
| -    | Lack of `ReentrancyGuard` in `destroyBlackFunds`             | Medium severity          | ❌       | FP                         |
| -    | Owner Can Arbitrarily Mint and Burn Tokens                   | Medium severity          | ❌       | FP                         |
| -    | Fee Calculation Vulnerability (Precision Loss)               | Medium severity          | ❌       | FP                         |
| -    | No Upper Limit on `issue` Function                           | Medium severity          | ❌       | FP                         |
| -    | Hardcoded Fee Limit (`MAX_BASIS_POINTS`)                     | Low severity             | ❌       | FP                         |
| -    | Lack of Constructor Validation for `owner` and `compliance`  | Low severity             | ❌       | FP                         |
| -    | Centralized Control Over Blacklist                           | Low severity             | ❌       | FP                         |
| -    | Missing Return Values in `transfer` and `transferFrom`       | Informational severity   | ❌       | FP                         |
| -    | Non-Standard ERC20 Implementations                           | Informational severity   | ❌       | FP                         |
| -    | Lack of Comments on Some Critical Functions                  | Informational severity   | ❌       | FP                         |
| -    | Potential Centralization Risks                               | Undetermined severity    | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 16 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|-------------------------|-------------------------|  
| V02                | Low                       | Medium                  | **1**                   |  

#### DeepSeek-R.1

| ID  | Descrição                                           | Severidade Detectada       | Correta? | Tipo (VP/FP/FN)                |
|-----|-----------------------------------------------------|----------------------------|----------|--------------------------------|
| V01 | transferFrom() Lacks notBlackListed Modifier on the Spender| -        | ❌       | FN      |
| V02 | Missing Validation for Parameters in the Constructor| -               | ❌       | FN       |
| V03 | Small Amount Can Ignore Fee on Transfer             | Medium               | ✅        | VP (severidade incorreta)                              |
| V04 | Fee Basis Points Can’t Reach the Maximum Unlike What Is Described| -  | ❌        | FN                              |
| V05 | Inaccurate Comments and Messages                    | -               | ❌        | FN                              |
| V06 | Settle Solidity Version                             | -               | ❌        | FN                              |
| -   | Blacklist Bypass for Recipients                     | High severity            | ❌       | FP                             |
| -   | ERC20 Approve Front-Running                         | High severity   | ❌        | FP                             |
| -   | Centralized Control Risks                           | High severity              | ❌        | FP                              |
| -   | Missing Transfer Event on Mint                      | Medium severity            | ❌       | FP                             |
| -   | Unrestricted Allowance Update Logic                 | Medium severity            | ❌       | FP                             |
| -   | Immutable Ownership                                  | Low severity               | ❌        | FP                              |
| -   | Lack of Address Validation in Blacklist             | Low severity               | ❌        | FP                              |
| -   | Non-Standard ERC20 Implementation                   | Informational              | ❌       | FP                              |
| -   | Potential Governance Risks                          | Informational              | ❌       | FP                             |
| -   | Fee Parameter Safety                                | Undetermined              | ❌       | FP                             |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 10 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|---------------------------|-------------------------|-------------------------|  
| V03                | Medium                       | Low                  | **1**                   |  

#### Llama 3.3

| ID  | Descrição                                                                 | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)              |
|-----|---------------------------------------------------------------------------|--------------------------|----------|------------------------------|
| V01 | Permissão de gastar tokens (`transferFrom` sem validação adicional)       | High severity            | ✅       | VP (severidade incorreta)   |
| V02 | Falta de validação de entrada                                             | Medium severity          | ✅       | VP                          |
| V03 | Pequenos valores podem ignorar taxa                                       | -         | ❌       | FN                          |
| V04 | Taxa de pontos base não atinge o máximo descrito na documentação          | Informational         | ✅       | VP (severidade incorreta)                         |
| V05 | Comentários e mensagens imprecisas                                        | -         | ❌       | FN                          |
| V06 | Falta de definição explícita da versão do Solidity                        | -         | ❌       | FN                          |
| -   | Reentrância                                                               | High severity            | ❌       | FP                          |
| -   | Potential de(commit-time reentrancy)                                      | High severity            | ❌       | FP                          |
| -   | Uso de `tx.origin`                                                        | Medium severity          | ❌       | FP                          |
| -   | Potencial DoS (Denial of Service)                                         | Medium severity          | ❌       | FP                          |
| -   | Boas Práticas de Segurança                                                | Low severity             | ❌       | FP                          |
| -   | Falta de eventos para todas as ações                                      | Low severity             | ❌       | FP                          |
| -   | Impacto de atualizações                                                   | Undetermined              | ❌       | FP                          |
| -   | sanação de reentrância nas funções                                        | Undetermined              | ❌       | FP                          |
| -   | Conformidade e regulamentação                                             | Informational            | ❌       | FP                          |

### **Matriz de Confusão:**  

|               | Vulnerável (Real) | Não Vulnerável (Real) |  
|---------------|------------------|----------------------|  
| **Detectado** | 3 (VP)           | 9 (FP)              |  
| **Não Detectado** | 3 (FN)       | 0 (VN)              |  

### **Erro de Classificação**  

| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença |  
|--------------------|-------------------------|------------------------|-----------|  
| V01               | High                     | Medium                 | **1**     |  
| V04               | Informational            | Minor                  | **1**     |  

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                                                 | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)              |
|-----|---------------------------------------------------------------------------|--------------------------|----------|------------------------------|
| V01 | Permissão de gastar tokens (`transferFrom` sem validação adicional)       | -            | ❌       | FN                          |
| V02 | Falta de validação de entrada                                             | -          | ❌       | FN                          |
| V03 | Pequenos valores podem ignorar taxa                                       | -         | ❌       | FN                          |
| V04 | Taxa de pontos base não atinge o máximo descrito na documentação          | -         | ❌       | FN                          |
| V05 | Comentários e mensagens imprecisas                                        | -         | ❌       | FN                          |
| V06 | Falta de definição explícita da versão do Solidity                        | -         | ❌       | FN                          |
| -   | Possível Underflow Aritmético em `destroyBlackFunds` e `redeem`           | Low severity             | ❌       | FP                          |
| -   | Redundância ou potencial problema lógico na função `redeem`               | Low severity             | ❌       | FP                          |
| -   | Centralização e Confiança nas Funções de Proprietário e Compliance        | Informational            | ❌       | FP                          |
| -   | Ausência de Proteção Contra Reentrância (Contexto ERC20)                  | Informational            | ❌       | FP                          |

---

### **Matriz de Confusão:**  

|               | Vulnerável (Real) | Não Vulnerável (Real) |  
|---------------|------------------|----------------------|  
| **Detectado** | 0 (VP)           | 4 (FP)              |  
| **Não Detectado** | 6 (FN)       | 0 (VN)              |  

### **Não houve Erro de Classificação**  


## Métricas Agregadas (USDKG.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 12.83 |
| **DeepSeek-R1** | 43.06 |
| **Llama 3.3** | 20.39 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 12.45 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 16 | 5 | 0 |
| **DeepSeek-R1** | 1 | 10 | 5 | 0 |
| **Llama 3.3** | 3 | 9 | 3 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 6 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 1 | 1 | 1.00 |
| **DeepSeek-R1** | 1 | 1 | 1.00 |
| **Llama 3.3** | 2 | 3 | 0.67 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

