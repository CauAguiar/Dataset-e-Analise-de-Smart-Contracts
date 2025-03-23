# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `OUSD`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                             | Severidade             |
|-----|------------------------------------------------------|------------------------|
| V01 | Usuários não têm controle sobre delegação de yield  | Low severity          |
| V02 | Falta de docstrings em eventos e funções            | Informational findings |
| V03 | Pragma flutuante no Solidity                        | Informational findings |
| V04 | Código redundante | Informational findings |
| V05 | Docstrings incompletas em funções públicas          | Informational findings |
| V06 | Falta de parâmetros nomeados em mapeamentos        | Informational findings |
| V07 | Operações de armazenamento otimizáveis              | Low severity          |
| V08 | Erros tipográficos na documentação                 | Informational findings |

---

### Análise por LLM

#### GPT-4o
| ID   | Descrição                                             | Severidade Detectada       | Correta? | Tipo (VP/FP/FN)               |
|------|------------------------------------------------------|---------------------------|----------|------------------------------|
| V01  | Usuários não têm controle sobre delegação de yield            | High severity             | ✅       | VP (severidade incorreta)   |    
| V02  | Falta de Docstrings em Eventos e Funções           | Informational findings    | ✅       | VP                          |  
| V03  | Pragma Flutuante no Solidity                        | -    | ❌       | FN                          |
| V04  | Código Redundante | Informational findings | ✅       | VP                          | 
| V05  | Docstrings Incompletas em Funções Públicas          | Informational findings    | ✅       | VP                          |  
| V06  | Falta de Parâmetros Nomeados em Mapeamentos         | -    | ❌       | FN                          |
| V07  | Operações de Armazenamento Otimizáveis              | -              | ❌       | FN                          |
| V08  | Erros Tipográficos na Documentação                 | Informational findings    | ✅       | VP                          |  
| -    | Integer Overflow/Underflow                          | High severity             | ❌       | FP                          |
| -    | Reentrancy Attack                                   | High severity             | ❌       | FP                          |
| -    | Armazenamento de Dados Não Protegido               | High severity             | ❌       | FP                          |
| -    | Falta de Proteção Contra Endereços Maliciosos      | Medium severity           | ❌       | FP                          |
| -    | Dependência de Estados Globais Sem Sincronização   | Medium severity           | ❌       | FP                          |
| -    | Falta de Eventos em Algumas Mudanças de Estado     | Medium severity           | ❌       | FP                          |
| -    | Uso de `require` Sem Mensagens Detalhadas          | Low severity              | ❌       | FP                          |
| -    | Possível Rounding Error em Cálculos de Rebasing    | Low severity              | ❌       | FP                          |

### **Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 5 (VP)             | 8 (FP)                |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

### **Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença |
|--------------------|--------------------------|------------------------|-----------|
| V01               | High                      | Low                    | **2**     |

---

#### DeepSeek-R1
| ID | Descrição                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)          |
|----|--------------------------------|--------------------------|----------|--------------------------|
| V01 | Usuários não têm controle sobre delegação de yield | High severity         | ✅      | VP (severidade incorreta) |
| V02 | Falta de docstrings em eventos e funções | -            | ❌      | FN  |
| V03 | Pragma flutuante no Solidity                | -                               | ❌       | FN                       |
| V04 | Código redundante                          | -                               | ❌       | FN                       |
| V05 | Docstrings incompletas em funções públicas | -                               | ❌       | FN                       |
| V06 | Falta de parâmetros nomeados em mapeamentos | -                               | ❌       | FN                       |
| V07 | Operações de armazenamento otimizáveis | -           | ❌       | FN                      |
| V08 | Erros tipográficos na documentação        | -                               | ❌       | FN                       |
| -   | Division by Zero in Supply Adjustment   | High severity          | ❌       | FP                       |
| -   | Rounding Errors in Credit Conversions   | Medium severity      | ❌       | FP                       |
| -   | Front-Runnable Approvals                    | Medium severity      | ❌       | FP                       |
| -   | Forced Non-Rebasing Migration for Contracts | Medium severity      | ❌       | FP                       |
| -   | Deprecated Storage Variable                   | Low severity            | ❌       | FP                       |
| -   | Upgradeable Storage Gaps                     | Informational           | ❌       | FP                       |
| -   | Complex Rebasing Logic                         | Informational           | ❌       | FP                       |
| -   | Governance Privilege Escalation              | Undetermined            | ❌       | FP                       |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 8 (FP)                 |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V01                | High              | Low                   | **2**    | 

#### Llama 3.3
| ID  | Descrição                                       | Severidade Detectada       | Correta? | Tipo (VP/FP/FN) |
|-----|------------------------------------------------|--------------------------|----------|--------------------------|
| V01 | Usuários não têm controle sobre delegação de yield | -       |  ❌       | FN |
| V02 | Falta de docstrings em eventos e funções        | -        | ❌        | FN          |
| V03 | Pragma flutuante no Solidity                  | -                        | ❌       | FN                       |
| V04 | Código redundante                             | -                        | ❌       | FN                       |
| V05 | Docstrings incompletas em funções públicas    | -                        | ❌       | FN                       |
| V06 | Falta de parâmetros nomeados em mapeamentos   | -                        | ❌       | FN                       |
| V07 | Operações de armazenamento otimizáveis      | -                        | ❌       | FN                       |
| V08 | Erros tipográficos na documentação            | -                        | ❌       | FN                       |
| -   | Reentrancy                                    | High severity            | ❌       | FP                       |
| -   | Unprotected Function                          | High severity            | ❌       | FP                       |
| -   | Unsecured Use of Tx_ORIGIN                    | High severity            | ❌       | FP                       |
| -   | Use of Deprecated Functions                   | Medium severity          | ❌       | FP                       |
| -   | Unprotected Variable                          | Medium severity          | ❌       | FP                       |
| -   | Integer Overflow                              | Medium severity          | ❌       | FP                       |
| -   | Missing Input Validation                      | Low severity             | ❌       | FP                       |
| -   | Inefficient Code                              | Low severity             | ❌       | FP                       |
| -   | Complexidade do Contrato                      | Undetermined             | ❌       | FP                       |
| -   | Uso de Bibliotecas Desatualizadas            | Informational findings   | ❌       | FP                       |
| -   | Falta de Documentação                         | Informational findings   | ❌       | FP                       |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 11 (FP)                 |
| **Não Detectado** | 8 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação


#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                       | Severidade Detectada       | Correta? | Tipo (VP/FP/FN) |
|-----|------------------------------------------------|--------------------------|----------|--------------------------|
| V01 | Usuários não têm controle sobre delegação de yield | -    | ❌       | FN                     |
| V02 | Falta de docstrings em eventos e funções        | -  | ❌       | FN                     |
| V03 | Pragma flutuante no Solidity                  | - | ❌        | FN                      |
| V04 | Código redundante                             | - | ❌       | FN                      |
| V05 | Docstrings incompletas em funções públicas    | -  | ❌       | FN                      |
| V06 | Falta de parâmetros nomeados em mapeamentos   | -  | ❌        | FN                      |
| V07 | Operações de armazenamento otimizáveis      | -           | ❌      | FN                      |
| V08 | Erros tipográficos na documentação            | - | ❌        | FN                      |
| -   | Inicialização Não Segura                     | Medium severity         | ❌       | FP                      |
| -   | Falta de Validação de Entrada em `_initialCreditsPerToken`| Low severity    | ❌       | FP                      |
| -   | Problemas de Precisão e Arredondamento        | Low severity            | ❌       | FP                      |
| -   | Risco de Reentrância em `_adjustAccount`     | Undetermined            | ❌       | FP                      |
| -   | Acumulação de Erros de Arredondamento       | Low severity            | ❌       | FP                      |
| -   | Complexidade e Riscos em Deleg. de Rendimento | Medium severity         | ❌       | FP                      |
| -   | Minting Não Controlado                        | Medium severity         | ❌       | FP                      |
| -   | Possíveis Erros de Lógica em `_autoMigrate`  | Low severity            | ❌       | FP                      |
| -   | Verificação de Arredondamento               | Low severity            | ❌       | FP                      |
| -   | Risco de Divisão por Zero                     | Medium severity         | ❌       | FP                      |
| -   | Risco de Manipulação de Fornecimento        | High severity           | ❌       | FP                      |
| -   | Complexidade e Riscos em `delegateYield`      | Medium severity         | ❌       | FP                      |
| -   | Risco de Reentrância em `delegateYield`      | Undetermined            | ❌       | FP                      |
| -   | Riscos na Lógica de `undelegateYield`        | Medium severity         | ❌       | FP                      |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 14 (FP)                 |
| **Não Detectado** | 8 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erro de classificação


## Métricas Agregadas (OUSD.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 10.03 |
| **DeepSeek-R1** | 157.25 |
| **Llama 3.3** | 7.89 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 17.92 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 5 | 8 | 3 | 0 |
| **DeepSeek-R1** | 1 | 8 | 7 | 0 |
| **Llama 3.3** | 0 | 11 | 8 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 14 | 8 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 2 | 5 | 0.40 |
| **DeepSeek-R1** | 2 | 1 | 2.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

