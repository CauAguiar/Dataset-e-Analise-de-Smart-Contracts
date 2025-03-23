# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `ShootERC20`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                            | Severidade           |
|-----|------------------------------------------------------|----------------------|
| MS-1 | Token Holders Can Burn Their Tokens                | Informational       |
| MS-2 | Lack of Specification and Test Suite               | Informational       |
| MS-3 | Unlocked Pragma                                    | Informational       |
| MS-4 | Allowance Double-Spend Exploit                     | Informational       |
| MS-5 | Accidentally Transferred Funds to the Contract Are Locked | Informational |

### GPT-4o

| ID   | Descrição                                          | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)              |
|------|--------------------------------------------------|--------------------------|----------|--------------------------|
| MS-1 | Token Holders Can Burn Their Tokens            | Informational           | ✅       | VP                       |
| MS-2 | Lack of Specification and Test Suite           | -           | ❌       | FN                       |
| MS-3 | Unlocked Pragma                                | -           | ❌       | FN                       |
| MS-4 | Allowance Double-Spend Exploit                 | Medium           | ✅       | VP (severidade incorreta) |
| MS-5 | Accidentally Transferred Funds to the Contract Are Locked | Informational | ❌       | FN                       |
| -    | Possível Problema com Reentrância (Reentrancy) | High                    | ❌       | FP                       |
| -    | Uso de `unchecked` Sem Verificação Adequada   | Low                     | ❌       | FP                       |
| -    | Falta de Eventos para Algumas Funções Importantes | Informational           | ❌       | FP                       |
| -    | Ausência de Mecanismo de Atualização ou Governança | Undetermined            | ❌       | FP                       | 

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 4 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Erro de Classificação**

| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| MS-4                | Medium              | Informational                   | **2**    |  

### DeepSeek-R1

| ID   | Descrição                                               | Severidade Detectada   | Correta? | Tipo (VP/FP/FN)             |
|------|---------------------------------------------------|----------------------|----------|--------------------------|
| MS-1 | Token Holders Can Burn Their Tokens              | Informational       | ✅       | VP                       |
| MS-2 | Lack of Specification and Test Suite            | -       | ❌       | FN                       |
| MS-3 | Unlocked Pragma                                  | -       | ❌       | FN                       |
| MS-4 | Allowance Double-Spend Exploit                   | Informational       | ✅       | VP                       |
| MS-5 | Accidentally Transferred Funds to the Contract Are Locked | - | ❌       | FN                       |
| -    | Fixed Token Supply                              | Informational       | ❌       | FP                       |
| -    | OpenZeppelin Dependency                         | Informational       | ❌       | FP                       |
| -    | Large Initial Supply                            | Informational       | ❌       | FP                       |

**Matriz de Confusão:**  
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 3 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**  

### Llama 3.3

| ID  | Descrição                                             | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)                |
|-----|------------------------------------------------------|----------------------|----------|--------------------------|
| MS-1 | Token Holders Can Burn Their Tokens                | -                    | ❌       | FN                       |
| MS-2 | Lack of Specification and Test Suite               | -                    | ❌       | FN                       |
| MS-3 | Unlocked Pragma                                    | -                    | ❌       | FN                       |
| MS-4 | Allowance Double-Spend Exploit                     | -                    | ❌       | FN                       |
| MS-5 | Accidentally Transferred Funds to the Contract Are Locked | -             | ❌       | FN                       |
| -   | Reentrância                                        | High                 | ❌       | FP |
| -   | Permissões excessivas                              | High                 | ❌       | FP                       |
| -   | Falta de validação de entrada                     | Medium               | ❌       | FP                       |
| -   | Uso de `transfer` em vez de `safeTransfer`         | Medium               | ❌       | FP                       |
| -   | Falta de documentação                              | Low                  | ❌       | FP                       |
| -   | Uso de constantes mágicas                          | Low                  | ❌       | FP                       |
| -   | Comportamento não especificado                     | Undetermined         | ❌       | FP                       |
| -   | Uso de contrato herdado                            | Informational        | ❌       | FP                       |
| -   | Uso de funções virtuais                           | Informational        | ❌       | FP                       |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 9 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                            | Severidade Detectada      | Correta? | Tipo (VP/FP/FN) |
|-----|------------------------------------------------------|--------------------------|----------|----------------|
| MS-1 | Token Holders Can Burn Their Tokens                | -       | ❌       | FN            |
| MS-2 | Lack of Specification and Test Suite               | -       | ❌       | FN            |
| MS-3 | Unlocked Pragma                                    | -       | ❌       | FN            |
| MS-4 | Allowance Double-Spend Exploit                     | -       | ❌       | FN            |
| MS-5 | Accidentally Transferred Funds to the Contract Are Locked | - | ❌       | FN            |
| -   | Centralização na Mint Inicial                       | Low                      | ❌       | FP            |
| -   | Uso de Blocos `unchecked` para Otimização           | Informational            | ❌       | FP            |
| -   | Vulnerabilidade de Front-Running em `approve`       | Informational            | ❌       | FP            |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 3 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**


## Métricas Agregadas (ShootERC20.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 9.69 |
| **DeepSeek-R1** | 71.64 |
| **Llama 3.3** | 18.24 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 13.83 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 2 | 4 | 3 | 0 |
| **DeepSeek-R1** | 2 | 3 | 3 | 0 |
| **Llama 3.3** | 0 | 9 | 5 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 3 | 5 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 2 | 2 | 1.00 |
| **DeepSeek-R1** | 0 | 2 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

