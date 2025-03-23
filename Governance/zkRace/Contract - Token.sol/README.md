# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Token`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID            | Descrição                                               | Severidade              |
|--------------|---------------------------------------------------------|-------------------------|
| F-2024-1814 | Lack of token distribution leads to centralization problems | Medium severity         |
| F-2024-1810 | Total supply is not hardcoded                           | Medium severity         |
| F-2024-1822 | Floating Pragma                                         | Observation             |
| F-2024-1819 | Update import usages to add modularity                  | Observation             |
| F-2024-1818 | Constructor can be marked as payable                    | Observation             |

---

### Análise por LLM

#### GPT-4o
| ID            | Descrição                                               | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|--------------|---------------------------------------------------------|--------------------------|----------|-----------------|
| F-2024-1814 | Lack of token distribution leads to centralization problems | -       | ❌       | FN              |
| F-2024-1810 | Total supply is not hardcoded                           | Medium severity          | ✅       | VP              |
| F-2024-1822 | Floating Pragma                                         | -    | ❌       | FN              |
| F-2024-1819 | Update import usages to add modularity                  | -       | ❌       | FN              |
| F-2024-1818 | Constructor can be marked as payable                    | -       | ❌       | FN              |
| -           | Possível Ataque de Phishing por Nome/Símbolo Similar     | Low severity             | ❌       | FP              |
| -           | Contrato Sem Função de Queima ou Administração          | Informational            | ❌       | FP              |
| -           | Uso da Última Versão do OpenZeppelin (v5)               | Informational            | ❌       | FP              |
| -           | Documentação Explicativa Clara                          | Informational            | ❌       | FP              |

### **Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 4 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID | Descrição | Severidade Detectada | Correta? | Tipo (VP/FP/FN) |  
|--------------|-------------------------------------------|--------------------------|----------|-----------------|  
| F-2024-1814 | Lack of token distribution... | -| ❌ | FN |  
| F-2024-1810 | Total supply is not hardcoded | - | ❌ | FN |  
| F-2024-1822 | Floating Pragma | Informational | ✅ | VP |  
| F-2024-1819 | Update import usages... | - | ❌ | FN |  
| F-2024-1818 | Constructor can be marked as payable |- | ❌ | FN |  
| - | Validação de entrada ausente | Informational | ❌ | FP |  
| - | Documentação incompleta | Informational | ❌ | FP |  
| - | Configuração indesejada de `supply` | Undetermined | ❌ | FP |  

### **Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 3 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

---

### llhama 3.3 
| ID           | Descrição                                                   | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------------|---------------------------------------------------------------|--------------------------|----------|--------------------------|
| F-2024-1814 | Lack of token distribution leads to centralization problems   | -          | ❌       | FN                         |
| F-2024-1810 | Total supply is not hardcoded                                 | -                        | ❌       | FN                         |
| F-2024-1822 | Floating Pragma                                               | Low severity             | ✅       | VP (severidade incorreta) |
| F-2024-1819 | Update import usages to add modularity                        | -                        | ❌       | FN                         |
| F-2024-1818 | Constructor can be marked as payable                          | -                        | ❌       | FN                         |
| -           | Reentrância                                                   | High severity            | ❌       | FP                         |
| -           | Mintagem não limitada implicitamente                          | High severity            | ❌       | FP                         |
| -           | Falta de Controle de Permissões                               | Medium severity          | ❌       | FP                         |
| -           | Dependência em Bibliotecas Externas                          | Medium severity          | ❌       | FP                         |
| -           | Precisão da Documentação                                     | Low severity             | ❌       | FP                         |
| -           | Falhas de Segurança em `ERC20`                               | Undetermined             | ❌       | FP                         |
| -           | Legibilidade e Manutenção                                     | Informational            | ❌       | FP                         |
| -           | Configuração de Rede                                          | Informational            | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 8 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| F-2024-1822           | Low              | Observational       | **1**    |  

---

### Gemini 2.0 Flash Thinking Experimental 01-21
| ID           | Descrição                                                   | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|--------------|---------------------------------------------------------------|--------------------------|----------|--------------------------|
| F-2024-1814 | Lack of token distribution leads to centralization problems   | -         | ❌       | FN                         |
| F-2024-1810 | Total supply is not hardcoded                                 | -                        | ❌       | FN                         |
| F-2024-1822 | Floating Pragma                                               | -                        | ❌       | FN                         |
| F-2024-1819 | Update import usages to add modularity                        | -                        | ❌       | FN                         |
| F-2024-1818 | Constructor can be marked as payable                          | -                        | ❌       | FN                         |
| -           | Dependência não especificada da versão OpenZeppelin           | Informational            | ❌       | FP                         |
| -           | Falta de propriedade ou controle administrativo               | Medium severity          | ❌       | FP                         |
| -           | Potencial mal-entendido do parâmetro 'supply'                | Low severity             | ❌       | FP                         |
| -           | Visibilidade dos argumentos do construtor                     | Informational            | ❌       | FP                         |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |










## Métricas Agregadas (Token.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 20.43 |
| **DeepSeek-R1** | 48.61 |
| **Llama 3.3** | 38.20 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 13.72 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 4 | 4 | 0 |
| **DeepSeek-R1** | 1 | 3 | 4 | 0 |
| **Llama 3.3** | 1 | 8 | 4 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 5 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 1 | 0.00 |
| **DeepSeek-R1** | 0 | 1 | 0.00 |
| **Llama 3.3** | 2 | 1 | 2.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

